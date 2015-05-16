#!/bin/bash

set -e

sudo apt-get update
sudo apt-get upgrade

# Docker
echo "Installing docker..."
wget -qO- https://get.docker.com/ | sh

# Chrome
echo "Installing chrome..."
cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
# If this results in errors, try sudo apt-get -f install
# taken from http://askubuntu.com/questions/510056/how-to-install-google-chrome-on-ubuntu-14-04

sudo apt-get install python

# echo "Installing atom..."
# cd /tmp/
# wget https://github.com/atom/atom/releases/download/latest/atom.x86_64.rpm
# sudo dpkg --install atom-amd64.deb

#echo "setting ubuntu defaults..."
#source ../.defaults-ubuntu
