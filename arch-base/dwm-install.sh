#!/bin/sh

sudo timedatectl set-ntp true
sudo hwclock --systohc

sudo reflector -c Sweden -a 6 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

sudo pacman -S --noconfirm git thunar firefox redshift newsboat picom mpc mpv mpd ncmpcpp ffmpeg youtube-dl bat dunst

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd

# DWM
git clone https://github.com/Yog-Sothub/dwm.git
cd dwm
make && sudo make clean install
cd

# ST
git clone https://github.com/Yog-Sothub/st.git
cd st
make && sudo make clean install
cd

#DMENU
git clone https://github.com/Yog-Sothub/dmenu.git
cd dmenu
make && sudo make clean install
cd

# Dwmblocks
git clone https://github.com/Yog-Sothub/dwmblocks.git
cd dwmblocks
make && sudo make clean install
cd

# Void configs
git clone https://github.com/Yog-Sothub/void.git

cp ~/void/xinitrc .xinitrc
cp ~/void/Xdefaults .Xdefaults
cp ~/void/bash_profile .bash_profile
mkdir ~/.local/bin/ 
cp -r ~/void/local/bin/statusbar ~/.local/bin

cp -r ~/void/config/dunst ~/.config
cp -r ~/void/config/mpd ~/.config
cp -r ~/void/config/mpv ~/.config
cp -r ~/void/config/ncmpcpp ~/.config
cp -r ~/void/config/mpc ~/.config
cp -r ~/void/config/newsboat ~/.config
cp -r ~/void/config/picom ~/.config
cp -r ~/void/config/redshift ~/.config
cp -r ~/void/config/x11 ~/.config





