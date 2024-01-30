#!/bin/bash

sudo apt update
sudo apt-get install -y apache2
sudo apt-get install -y php libapache2-mod-php php-mysql

sudo sed -i 's/;extension=mysqli/extension=mysqli/' /etc/php/8.1/apache2/php.ini

sudo systemctl restart apache2