#!/bin/bash

set -e

echo "Updating dependencies..."
sudo apt-get update
sudo apt-get upgrade

echo "Install emacs..."
echo "sudo apt-get install emacs"

echo "Install docker..."
echo "wget -qO- https://get.docker.com/ | sh"
echo " "

echo "Install chrome..."
echo "visit https://www.google.com/chrome/browser/desktop/"
echo " "

echo "Install (or verify installation of) python"
echo "sudo apt-get install python"
echo " "

echo "Install Dropbox"
pushd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd && popd
echo " "

echo "Install sublime text 3..."
echo "visit https://www.sublimetext.com/3"
echo "then register it"
echo "then link user pkgs. pushd ~/.config/sublime-text-3/Packages; rm -rf User; ln -s <DROPBOX>/code/sublime-text-3/packages_user/ User;"
echo " "

echo "Install Go"
echo "visit https://golang.org/doc/install/source"
echo " "

echo "Install aws cli?"

echo "Install gcloud"
echo "curl https://sdk.cloud.google.com | bash"
echo " "

read -n1 -r -p "Press any key to continue..."
