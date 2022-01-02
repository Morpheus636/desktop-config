#!/bin/bash
#    © Copyright 2021 Josh Levin (Morpheus636 - https://github.com/morpheus636)
# 
#    This file is part of Morpheus636's desktop-config repository.
#
#    This repository (and everything in it) is free software: 
#    you can redistribute it and/or modify it under the terms 
#    of the GNU General Public License as published by the 
#    Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This repository is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this repository.  If not, see <https://www.gnu.org/licenses/>.

SCRIPTPATH="$(dirname $(dirname $(readlink -f $0))/$(basename $0))"
USERNAME=$1
HOMEDIR=/home/$1

# Make repos directory
mkdir -p $HOMEDIR/Documents/Repos

# BASH Configuration
cp ./assets/config/.bashrc $HOMEDIR
cp ./assets/config/.bash_aliases $HOMEDIR

# Set wallpaper
mkdir -p $HOMEDIR/Pictures/wallpaper
cp ./assets/wallpaper.jpg $HOMEDIR/Pictures/Wallpaper
gsettings set org.gnome.desktop.background picture-uri "file:///${HOMEDIR}/Pictures/Wallpaper/wallpaper.jpg"


# Set Profile Picture
cp $SCRIPTPATH/assets/pfp.png /var/lib/AccountsService/icons/$USERNAME


# TODO - Gnome Tweaks Configuration

# Git configuration
cp ./assets/config/.gitconfig $HOMEDIR/

# OpenVPN Configuration
if [[ -f "./config/client.ovpn" ]]; then
    nmcli connection import type openvpn file ./assets/config/client.ovpn
fi

# TODO - Install Zeal Docsets

# TODO - Thunderbird Configuration