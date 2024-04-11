#! /bin/bash

apt-get update && apt-get upgrade -y

# Install required packages for PHP, MySQL, and WordPress
apt-get install -y software-properties-common
add-apt-repository -y ppa:ondrej/php # For latest PHP version
apt-get update
apt-get install -y php7.4 php7.4-mysql php7.4-curl php7.4-gd php7.4-mbstring php7.4-xml php7.4-zip php7.4-xmlrpc

apt-get install -y apache2
a2enmod rewrite
systemctl enable apache2
systemctl restart apache2

# Download and extract WordPress

cd /tmp || true
curl -LO https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz -C /var/www/html/
chown -R www-data:www-data /var/www/html/wordpress
chmod -R 755 /var/www/html/wordpress

rm /tmp/latest.tar.gz