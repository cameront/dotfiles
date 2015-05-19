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
PKG=google-chrome-stable_current_amd64.deb
wget https://dl.google.com/linux/direct/$PKG
sudo dpkg -i $PKG
# If this results in errors, try sudo apt-get -f install
# taken from http://askubuntu.com/questions/510056/how-to-install-google-chrome-on-ubuntu-14-04

# Python
echo "Installing python..."
sudo apt-get install python

# Sublime Text 3
echo "Installing sublime text 3..."
cd /tmp
PKG=sublime-text_build-3083_amd64.deb
wget http://c758482.r82.cf2.rackcdn.com/$PKG
sudo dpkg -i $PKG

# echo "Installing atom..."
# cd /tmp/
# wget https://github.com/atom/atom/releases/download/latest/atom.x86_64.rpm
# sudo dpkg --install atom-amd64.deb

#echo "setting ubuntu defaults..."
#source ../.defaults-ubuntu
