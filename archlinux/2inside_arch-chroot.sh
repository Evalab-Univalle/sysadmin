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
pacman -S networkmanager dnsmasq
systemctl enable NetworkManager.service

## Create an initial ramdisk environment ( TODO: Confirm this is not necessary)
mkinitcpio -p linux

## Instalar grub
pacman -S grub os-prober
grub-install --target=i386-pc --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

## Cambiar password del root
echo "Cambiar password del root con passwd"
passwd

echo "Ctrl+D para salir de chroot, umount -R /mnt/ , y reinicia"
