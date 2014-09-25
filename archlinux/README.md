#Arch Linux install

Pasos para la instalación de arch linux, de forma personalizada y automatizada para un computador en evalab.
Ver la descripción de cada archivo para ver cuáles tiene pasos que no pueden ser automatizados.

Para un script más genral ver [AUI]. Para un script más personalizado, para el hogar ver [dotfiles].

##1prepare_and_base-system.sh
Preparación del ambiente para instalar (dar internet al instalador, particionar discos, etc.) e instalar sistema base. *Hay pasos aquí que no se pueden automatizar*. Una vez dentro del instalador se puede descargar este archivo con: ```wget https://raw.githubusercontent.com/Evalab-Univalle/sysadmin/master/archlinux/1prepare_and_base-system.sh```

##2inside_arch-chroot.sh
Grub, internet y demás cosas básicas para poder terminar la instalación sin cd

##3after-reboot.sh =>
Instalación de los demás programas y entornos gráficos para que se pueda trabajar EN GENERAL en evalab.

[AUI]:https://github.com/helmuthdu/aui
[dotfiles]:https://github.com/AndresRicardoTorres/dotfiles
