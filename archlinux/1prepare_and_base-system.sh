dhcpcd


# fdisk /dev/sda
#Seguir pasos en fdisk para crear las siguientes particiones EN ESE ORDEN:
##1. swap: 4GB
##2. linux: 32GB (para arch)
##3. linux: 32GB (para el otro S.O.)
##4. linux: 81GB (o el restante, para el home)

#Formatear con ext4
mkfs.ext4 /dev/sda2
# mkfs.ext4 /dev/sda4 #Tener en cuenta que esta partición es el /home y es compartida por los dos sistemas operativos
mkswap /dev/sda1

#Montar discos para instalar
mount /dev/sda2 /mnt
mkdir /mnt/home
mount /dev/sda4 /mnt/home

## Agregar la url de la Unal de primera en mirrorlist
sed -i 1i"Server = http://www.laqee.unal.edu.co/archlinux/\$repo/os/\$arch" /etc/pacman.d/mirrorlist

## Instalar sistema base (TODO: --no-confirm)
pacstrap -i /mnt base
## Generar fstab
genfstab -U -p /mnt/ >> /mnt/etc/fstab

## Copiar siguiente script
cp 2.sh /mnt/home/
arch-chroot /mnt /bin/bash
## Maybe works with arch-chroot /mnt 2.sh
