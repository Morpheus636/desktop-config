#!/bin/bash

scriptpath="$(dirname $(readlink -f $0))/$(basename $0)"

# Update System
apt update
apt install upgrade

# Easy Installations
apt install software-properties-common -y
apt install apt-transport-https -y
apt install wget -y
apt install git -y
apt install nodejs -y
apt install gnome-tweaks -y
apt install gnome-shell-extensions -y
snap install pycharm-community --classic
snap install discord
apt install vim -y
apt install curl -y
export PATH="/usr/lib/postgresql/12/bin/:$PATH"

# Pop Shell
apt install node-typescript -y make git
git clone https://github.com/pop-os/shell
cd ./shell # CD into the repo clone
make local-install
cd $scriptpath # CD back to the source dir.

# Install Theme
./instalTheme.sh

# Add Deadsnakes PPA (For multiple python versions)
add-apt-repository ppa:deadsnakes/ppa
apt update

# Install Chrome
add-apt-repository "https://github.com/Morpheus636/desktop-config/blob/main/setup.sh"
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
apt update
apt install google-chrome-stable -y

# Install VSCode
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
apt update
apt install code -y

# Install Docker and Compose
apt install ca-certificates -y
apt install gnupg -y
apt install lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt install docker-ce docker-ce-cli conteinerd.io 
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose