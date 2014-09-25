nmcli con up ifname enp0s25

echo "Compueba la hora y arreglala si es necesario"
## Check time, and fix if necessary
timedatectl status
## timedatectl set-time "2014-01-12 21:04:00"
## pacman -S ntp
## ntpd -q


MULTILIB=`grep -n "\[multilib\]" /etc/pacman.conf | cut -f1 -d:`
sed -i "${MULTILIB}s/^#//" /etc/pacman.conf
MULTILIB=$(( $MULTILIB + 1 ))
sed -i "${MULTILIB}s/^#//" /etc/pacman.conf
pacman -Sy

## Create user
# useradd eva -m
# usermod -aG wheel eva
# echo "Cambiar password para la cuenta eva"
# passwd eva

## Basic, X server, sound
pacman -S mesa xorg-server xorg-xinit alsa-utils pulseaudio pulseaudio-alsa vim ntfs-3g openssh wget

systemctl enable sshd.service
systemctl enable systemd-readahead-collect
systemctl enable systemd-readahead-replay

## [Optional] Intel graphics driver
pacman -S nvidia
# pacman -S xf86-video-intel

## [Optional] For laptops
# pacman -S xf86-input-synaptics

## Util
pacman -S htop bash-completion zip unzip unrar zsh bc avahi nss-mdns dosfstools terminator

systemctl enable avahi-daemon.service

## Web
pacman -S firefox chromium flashplugin

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

yaourt -S google-talkplugin 

sed -i '/%wheel ALL=(ALL) ALL/s/^#//' /etc/sudoers

pacman -S lightdm lightdm-kde-greeter lightdm-gtk3-greeter

system_ctl enable lightdm

pacman -S cinnamon
pacman -S gnome gnome-extra gnome-tweak-tool gnome-power-manager network-manager-applet
pacman -S kdesdk-kate kdegraphics-ksnapshot kdegraphics-okular kdeutils-ark kdebase kdebase-workspace yakuake ttf-dejavu ttf-liberation kdemultimedia-kmix k3b kdeplasma-applets-plasma-nm
pacman -S eclipse meld git libreoffice libreoffice-es texlive-most virtualbox virtualbox-host-modules lyx

echo "ejecuta: hostnamectl set-hostname eva0#, y arregla el hostname"
