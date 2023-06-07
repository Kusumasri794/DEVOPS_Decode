#!/bin/bash

#variable declaration

echo "variable declaration"

PACKAGE="httpd wget unzip"
SVC="httpd"
URL='https://www.tooplate.com/zip-templates/2098_health.zip'
ART_NAME='2098_health'
TEMPDIR=/tmp/webset


# Installing Dependencies

echo "##################################################"
echo "Installing HTTPD and UNZIP pacakages"

sudo yum install $PACKAGE -y

# Start & Enable Service
echo "##################################################"
echo "start and enabling $SVC service"
sudo systemctl start $SVC
sudo systemctl enable $SVC


# Creating Temp Directory

echo "##########################################"
echo "Creating temorary directories"
mkdir -p $TEMPDIR
cd  $TEMPDIR

echo "dowloading html package using an url "
wget $URL

echo "unzip a downloaded package"
unzip $ART_NAME.zip
echo "copy a package from current directory to /var/www/html directory"

sudo cp -r $ART_NAME/* /var/www/html


# Bounce Service
echo "##############################################"
echo "restarting a httpd service"

sudo systemctl restart $SVC


# Clean Up
echo "####################################"
echo "remove a temporary directory files"
rm -rf $TEMPDIR

echo "##############################################"
echo "check for the system status"
sudo systemctl status $SVC

echo "list down all files in /var/www/html"
ls /var/www/html

echo "get ip address of the html page to check for the status from the browser"
ifconfig

echo "exit"
