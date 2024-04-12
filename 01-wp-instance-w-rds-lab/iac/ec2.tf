resource "aws_instance" "web" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  user_data                   = data.template_file.init.rendered
  vpc_security_group_ids      = [aws_security_group.web_server_sg_tf.id]
  associate_public_ip_address = true
  tags = {
    Name = "Web Server"
  }

  depends_on = [aws_db_instance.default]
}

data "template_file" "init" {
  template = file("scripts/install_wordpress.sh.tpl")

  vars = {
    db_ip_address = aws_db_instance.default.endpoint # localhost
    WP_VERSION    = "latest"
  }
}