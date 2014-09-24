## Test internet connection, start if necessary
# netctl enable MyWifi
# systemctl start netctl@MyWifi.service

## Check time, and fix if necessary
## timedatectl status
## timedatectl set-time "2014-01-12 21:04:00"
## pacman -S ntp
## ntpd -q

## Check /etc/sudoers with visudo => activate sudo group ( first install sudo )
## pacman -S sudo
## Check /etc/pacman.conf => activate multilib for skype and steam

## Create user
groupadd sudo
useradd andresrtm -m
usermod -aG sudo andresrtm
echo "Changin pasword for my account"
passwd andresrtm

## Basic, X server, sound
pacman -S mesa  xorg-server xorg-xinit alsa-utils vim

## [Optional] Intel graphics driver
pacman -S xf86-video-intel

## [Optional] For laptops
pacman -S xf86-input-synaptics

## Util
pacman -S htop bash-completion unzip  unrar zsh bc

## Web
pacman -S firefox chromium skype flashplugin


## For AUR
pacman -S base-devel

## From [http://archlinux.fr/yaourt-en]
curl -O https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz
tar zxvf package-query.tar.gz
cd package-query
makepkg -si --asroot
cd ..
curl -O https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz
tar zxvf yaourt.tar.gz
cd yaourt
makepkg -si --asroot
cd ..

yaourt -S spotify google-talkplugin 
