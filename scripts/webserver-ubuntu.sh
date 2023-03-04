#!/bin/bash
sudo apt update
sudo apt install apache2 
sudo cp /etc/apache2/sites-available/000-default.conf  /etc/apache2/sites-available/000-default.conf.bk
sudo cat << EOF >>  /etc/apache2/sites-available/000-default.conf  
 <VirtualHost *:80> 
ProxyPass / http://IP of internal instance:8080/ 
</VirtualHost>
EOF

sudo a2enmod 
sudo /etc/init.d/apache2 reload 
sudo systemctl restart appache2
sudo systemctl enable  apache2
