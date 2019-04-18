#!/bin/sh
# Change cd line to your path to orig minecraft.jar, NOT ~/.minecraft/bin
sudo cp /vagrant/install/* /vagrant 
#java -jar /vagrant/sikulix.jar 
screen -dmS Sikulix sh
screen -s Sokulix -X stuff  "java -jar /vagrant/sikulix.jar 
"