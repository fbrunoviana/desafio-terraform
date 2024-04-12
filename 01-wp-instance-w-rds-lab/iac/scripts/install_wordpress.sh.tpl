#!/bin/bash

# Define the WordPress version and installation directory
WP_VERSION="${WP_VERSION}"
WP_DIR="/var/www/wordpress"

# Database configuration parameters
DB_NAME="wordpress"
DB_USER="guelo"
DB_PASSWORD="gueloqueima12"
DB_HOST="${db_ip_address}"

# Update and install necessary packages
sudo apt-get update
sudo apt-get install -y apache2 php php-mysql libapache2-mod-php wget unzip

# Check if Apache is running, and start if not
sudo systemctl is-active --quiet apache2 || sudo systemctl start apache2

# Enable Apache rewrite module
sudo a2enmod rewrite
sudo systemctl restart apache2

# Download and unpack WordPress
wget https://wordpress.org/${WP_VERSION}.tar.gz
tar -xzf ${WP_VERSION}.tar.gz

# Move WordPress files to the desired directory
sudo mv wordpress $WP_DIR

# Set correct permissions for WordPress
sudo chown -R www-data:www-data $WP_DIR
sudo find $WP_DIR -type d -exec chmod 750 {} \;
sudo find $WP_DIR -type f -exec chmod 640 {} \;

# Configure wp-config.php
cp $WP_DIR/wp-config-sample.php $WP_DIR/wp-config.php
sed -i "s/database_name_here/$DB_NAME/" $WP_DIR/wp-config.php
sed -i "s/username_here/$DB_USER/" $WP_DIR/wp-config.php
sed -i "s/password_here/$DB_PASSWORD/" $WP_DIR/wp-config.php
sed -i "s/localhost/$DB_HOST/" $WP_DIR/wp-config.php

# Add security keys (fetching from WordPress API)
SECURITY_KEYS=$(wget -qO- https://api.wordpress.org/secret-key/1.1/salt/)
printf "%s\n" "$SECURITY_KEYS" | sed -i "/AUTH_KEY/r /dev/stdin" $WP_DIR/wp-config.php
sed -i '/AUTH_KEY/d' $WP_DIR/wp-config.php

# Remove the downloaded tar file
rm ${WP_VERSION}.tar.gz