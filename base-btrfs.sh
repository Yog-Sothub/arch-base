#!/bin/bash

ln -sf /usr/share/zoneinfo/Europe/Stockholm /etc/localtime
hwclock --systohc
sed -i '444s/.//' /etc/locale.gen
locale-gen
echo "LANG=sv_SE.UTF-8" >> /etc/locale.conf
echo "KEYMAP=sv-latin1" >> /etc/vconsole.conf
echo "pomelo" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 pomelo.localdomain pomelo" >> /etc/hosts
echo root:password | chpasswd

# paket att installera
pacman -S grub grub-btrfs efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools reflector base-devel linux-lts-headers avahi xdg-user-dirs xdg-utils gvfs nfs-utils inetutils dnsutils alsa-utils pipewire pipewire-pulse pipewire-jack bash-completion rsync acpi acpid acpi-call tlp ufw flatpak terminus-font pamixer pavucontrol xf86-video-intel mesa libva-intel-driver

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable tlp
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable ufw
systemctl enable acpid

useradd -mG wheel andreo
echo andreo:password | chpasswd

echo "andreo ALL=(ALL) ALL" >> /etc/sudoers.d/andreo


