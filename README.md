# dotfiles
Arch linux config

# Installation

First do everything from the guide up until the `pacstrap` command (and including the `pacstrap`. Then login with `arch-chroot`.

## `arch-chroot` packages and stuff

```sh
ln -sf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime
hwclock --systohc
pacman -S neovim
# Update /etc/locale.gen
locale-gen

pacman -S \
  linux \
  linux-headers \
  base-devel \
  openssh \
  networkmanager \
  wpa_supplicant \
  wireless_tools \
  netctl \
  dialog \
  grub \
  dosfstools \
  os-prober \
  mtools \
  efibootmgr \
  amd-ucode \
  libimobiledevice \  # iPhone USB tethering
  ntfs-g3 \  # Dual boot windows

# Check packages: sudo

systemctl enable sshd
systemctl enable NetworkManager

# Grub stuff
mkdir /boot/EFI
mount /dev/efi_partition /boot/EFI
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo
grub-mkconfig -o /boot/grub/grub.conf
```

## Default packages
```sh
sudo pacman -S \
  bashcompletion \
  docker \
  git \
  i3 \  # With i3-wm, not i3-gaps
  dmenu \
  xorg xorg-xinit \
  alacritty \
  nvidia \  # But check video card
  firefox \
  nodejs npm \
  pulseaudio \
  alsa-utils asoundconf \  # sound
  lightdm lightdm-gtk-greet \  # startup screen, don't forget to enable (systemctl)
  feh \  # for your cool background
  python python-pip \
  network-manager-applet \
  openvpn networkmanager-openvpn \
  mysql \  # Needed for pip mysqlclient
```

## AUR default packages
```
homeshick  # Following their docs!
spotify
```

