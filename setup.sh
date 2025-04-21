#!/bin/bash
sudo apt update && apt install wget unzip -y
cd /var/www/html
mkdir temp && cd temp
wget https://www.tooplate.com/zip-templates/2130_waso_strategy.zip 
unzip -o 2130_waso_strategy.zip
cd 2130_waso_strategy
cp -r * ../../
sudo systemctl restart apache2 
