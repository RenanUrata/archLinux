#!/bin/sh
#cfdisk /dev/sda
echo should 
esp=${1?Set esp partition}
swap=${2?Set swap partition}
root=${3?Set root partition}
mkfs.fat -F32 /dev/$esp
mkswap /dev/$swap
swapon /dev/$swap
mkfs.ext4 /dev/$root
pacman -Syy
pacman -S reflector
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
reflector -c "US" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist
mount /dev/$root /mnt
pacstrap /mnt base linux linux-firmware vim nano
genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt
#timedatectl list-timezones
timedatectl set-timezone America/Sao_Paulo
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
echo dev > /etc/hostname
echo 127.0.0.1	localhost >> /etc/hosts
echo ::1		localhost >> /etc/hosts
echo 127.0.1.1	dev >> /etc/hosts
passwd
pacman -S grub efibootmgr
mkdir /boot/efi
mount /dev/$esp /boot/efi
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg
pacman -S xorg
pacman -S lightdm lightdm-pantheon-greeter
systemctl start lightdm.service
systemctl enable lightdm.service
systemctl enable NetworkManager.service
#pacman -S gnome
#systemctl start gdm.service
#systemctl enable gdm.service 
#pacman -S xfc4
#pacman -Rs xfce4 #remove package and all dependecies related to it.
exit
reboot now