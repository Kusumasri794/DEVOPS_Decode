#!/bin/bash


# Installing Dependencies

echo "##################################################"
echo "Installing HTTPD and UNZIP pacakages"

sudo yum install httpd unzip -y

# Start & Enable Service
echo "##################################################"
echo "start and enabling httpd service"
sudo systemctl start httpd
sudo systemctl enable httpd


# Creating Temp Directory

echo "##########################################"
echo "Creating temorary directories"
mkdir /tmp/webset
cd -p /tmp/webset

echo "dowloading html package using an url "
wget https://www.tooplate.com/zip-templates/2098_health.zip

echo "unzip a downloaded package"
unzip 2098_health.zip
echo "copy a package from current directory to /var/www/html directory"

sudo cp -r 2098_health/* /var/www/html


# Bounce Service
echo "##############################################"
echo "restarting a httpd service"
sudo systemctl restart httpd



# Clean Up
echo "####################################"
echo "remove a temporary directory files"
rm -rf /tmp/webset

echo "##############################################"
echo "check for the system status"
sudo systemctl status httpd

echo "list down all files in /var/www/html"
ls /var/www/html

echo "get ip address of the html page to check for the status from the browser"
ifconfig

echo "exit"
