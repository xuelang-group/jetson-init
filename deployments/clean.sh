#!/bin/bash

# don't set -e
set +e 
# 1. set boot taget to non-desktop
# 2. remove desktop related files and packages 

# borrow from https://devtalk.nvidia.com/default/topic/1049161/jetson-nano/can-i-install-ubuntu-server-in-jetson-nano-/

set_boot_to_no_desktop() {
systemctl stop apt-daily.timer
systemctl disable apt-daily.timer
systemctl mask apt-daily.service
systemctl daemon-reload
}

ins
set_boot_to_no_desktop() {
    systemctl isolate multi-user.target
}

uninstall_desktop_packages() {
 
  #rm desktop
  apt-get remove -y nautilus nautilus-* gnome-power-manager gnome-screensaver gnome-termina* gnome-pane* gnome-applet* gnome-bluetooth gnome-desktop* gnome-sessio* gnome-user* gnome-shell-common zeitgeist-core libzeitgeist* gnome-control-center gnome-screenshot 
  apt-get remove --purge -y libreoffice*
  apt-get remove -y libreoffice-core snapd lightdm cups chromium* libcurlpp0
  apt-get update
  apt-get install -y network-manager
  apt-get install -y curl jq
  apt purge ubuntu-desktop -y && sudo apt autoremove -y && sudo apt autoclean
  apt-get autoremove -y
}
remove_files() {
  chown root:root / /lib
  
  #rm desktop files
  rm -rf ~/Desktop
  rm -rf ~/Documents
  rm -rf ~/Downloads
  rm -rf ~/Public
  rm -rf ~/Videos
  rm -rf ~/Classes
  rm -rf ~/Music
  rm -rf ~/examples.desktop
  rm -rf ~/Templates/
  rm -rf ~/Pictures
  rm -rf ~/VisionWorks-SFM-0.90-Samples
  rm -rf ~/NVIDIA_CUDA-9.0_Samples
  
  # rm sample code 
  rm -rf /usr/src/*
}

if [ `whoami` = "root" ];then
  set_boot_to_no_desktop
  uninstall_desktop_packages
  remove_files
else
  echo "error: no root user"
fi