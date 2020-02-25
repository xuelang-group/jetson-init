# borrow from https://devtalk.nvidia.com/default/topic/1049161/jetson-nano/can-i-install-ubuntu-server-in-jetson-nano-/
sudo systemctl isolate multi-user.target
sudo chown root:root / /lib
#rm desktop
sudo apt purge ubuntu-desktop -y && sudo apt autoremove -y && sudo apt autoclean
sudo apt-get remove -y nautilus nautilus-* gnome-power-manager gnome-screensaver gnome-termina* gnome-pane* gnome-applet* gnome-bluetooth gnome-desktop* gnome-sessio* gnome-user* gnome-shell-common zeitgeist-core libzeitgeist* gnome-control-center gnome-screenshot && sudo apt-get autoremove

sudo apt-get remove --purge libreoffice*
sudo apt-get remove libreoffice-core
sudo apt-get remove snapd lightdm cups chromium*
sudo apt-get remove libcurlpp0
sudo apt-get -y install network-manager

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
sudo rm -rf /usr/src/*
