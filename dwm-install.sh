#!/bin/sh

sudo timedatectl set-ntp true
sudo hwclock --systohc

sudo reflector -c Sweden -a 6 --protocol https --protocol http --sort rate --save /etc/pacman.d/mirrorlist

sudo pacman -S xorg thunar firefox redshift lxappearance neovim evince newsboat picom mpc mpv mpd ncmpcpp ffmpeg youtube-dl bat dunst arc-solid-gtk-theme papirus-icon-theme fish starship keepassxc htop neofetch sxiv ranger nitrogen mousepad playerctl ttf-dejavu gnu-free-fonts ttf-liberation noto-fonts ttf-hack ttf-fira-code adobe-source-code-pro-fonts noto-fonts-cjk noto-fonts-emoji ttf-fira-mono ttf-joypixels

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si 
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
cp ~/void/Xresources .Xresources
cp ~/void/bash_profile .bash_profile
mkdir ~/.local/bin/ 
mv ~/void/local/bin/statusbar ~/.local/bin/

mv ~/void/config/dunst ~/.config
mv ~/void/config/mpd ~/.config
mv ~/void/config/mpv ~/.config
mv ~/void/config/ncmpcpp ~/.config
mv ~/void/config/mpc ~/.config
mv ~/void/config/newsboat ~/.config
mv ~/void/config/picom ~/.config
mv ~/void/config/redshift ~/.config
mv ~/void/config/x11 ~/.config
mv ~/void/config/nvim ~/.config
mv ~/void/config/fish ~/.config





