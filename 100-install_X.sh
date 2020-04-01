#!/usr/bin/env bash
set -e

# Backup the old lightdm file if exist
if [ -f /etc/lightdm ]; then
  echo "----------------------------------------------------------------------";
  echo "     Backing up lightdm file";
  echo "----------------------------------------------------------------------";
  sudo mv /etc/lightdm /etc/lightdm.bak;
fi

# Installing packages
yay -Syyuu --needed --noconfirm xorg-server xf86-video-intel lightdm
yay -S --needed --noconfirm lightdm-webkit2-greeter
sudo sed -i 's/#greeter-session=example-gtk-gnome/greeter-session=lightdm-webkit2-greeter/g' /etc/lightdm/lightdm.conf
echo "----------------------------------------------------------------------"
echo "     Enabling lightdm"
echo "----------------------------------------------------------------------"
sudo systemctl enable lightdm

echo "----------------------------------------------------------------------"
echo "     Remove from lightdm the Dynamic User"
echo "----------------------------------------------------------------------"
grep -q /sbin/nologin /etc/lightdm/users.conf || sudo sh -c "sed -i 's|hidden-shells=/bin/false /usr/bin/nologin|hidden-shells=/bin/false /usr/bin/nologin /sbin/nologin|g' /etc/lightdm/users.conf"

echo "----------------------------------------------------------------------"
echo "     Fix for Intel backlight control"
echo "----------------------------------------------------------------------"
if [ -f /sys/class/backlight/intel_backlight/actual_brightness ] ; then
	sudo cp misc/10-backlight.conf /etc/X11/xorg.conf.d/10-backlight.conf
fi

echo "----------------------------------------------------------------------"
echo "     Setting up spanish keyboard"
echo "----------------------------------------------------------------------"
if [ -f /etc/X11/xorg.conf.d/*-keyboard.conf ]; then
        sudo sed -i 's/XkbLayout.*/XkbLayout" "es"/g' /etc/X11/xorg.conf.d/*-keyboard.conf
else
        sudo cp misc/10-keyboard.conf /etc/X11/xorg.conf.d/10-keyboard.conf
fi
