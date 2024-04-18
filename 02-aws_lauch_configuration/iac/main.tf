provider "aws" {
  region   = "us-east-2"
  insecure = true
}

resource "aws_launch_configuration" "multiples_guelo" {
  image_id        = "ami-0fb653ca2d3203ac1"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.sg_guelo.id]
  user_data = <<-EOF
              #! /bin/bash
              mkdir -p ${var.guelo_directory}
              echo "hello guelo" > ${var.guelo_directory}/index.html
              nohup busybox httpd -f -p ${var.port_guelo} -h ${var.guelo_directory} &
              EOF

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "gr_multiples_guelo" {
  launch_configuration = aws_launch_configuration.multiples_guelo.name
  vpc_zone_identifier  = data.aws_subnets.sub_guelo.ids
  min_size             = 2
  max_size             = 10
  tag {
    key                 = "Name"
    value               = "Guelo it's work"
    propagate_at_launch = true
  }
}

resource "aws_security_group" "sg_guelo" {
  name = "sg_guelo"
  ingress {
    from_port   = var.port_guelo
    to_port     = var.port_guelo
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "sub_guelo" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}