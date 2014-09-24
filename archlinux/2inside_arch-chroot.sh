## Locales
echo "es_CO.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=es_CO.UTF-8" > /etc/locale.conf
export LANG=es_CO.UTF-8
locale-gen

## Hora y fecha
ln -s /usr/share/zoneinfo/America/Bogota /etc/localtime
hwclock --systohc --utc

## Console keymap
echo "KEYMAP=la-latin1" > /etc/vconsole.conf

## Red
pacman -S networkmanager
systemctl enable NetworkManager.service

## Create an initial ramdisk environment ( TODO: Confirm this is not necessary)
mkinitcpio -p linux

## Instalar grub
pacman -S grub os-prober
grub-install --target=i386-pc --recheck /dev/sdb
grub-mkconfig -o /boot/grub/grub.cfg

## Cambiar password del root
echo "Change root password with passwd"
passwd

echo "exit for leave chroot, umount -R /mnt/ , and reboot"
