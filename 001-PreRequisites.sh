#!/usr/bin/env bash
set -e

if ! hash yay 2>/dev/null; then
  sudo pacman -S --needed --noconfirm go
  echo "----------------------------------------------------------------------"
  echo "     Installing dependencies"
  echo "----------------------------------------------------------------------"
fi

if ! hash yay 2>/dev/null # If yay doesn't exist
then
  echo "----------------------------------------------------------------------"
  echo "     Installing yay"
  echo "----------------------------------------------------------------------"
  if [ -d yay ]; then rm -rfv yay; fi
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --needed --noconfirm
fi


if ! hash yadm; then
  echo "----------------------------------------------------------------------"
  echo "     Installing git and yadm"
  echo "----------------------------------------------------------------------"
  yay -S --needed --noconfirm git yadm-git
fi

if [ -d yay ]; then
  echo "----------------------------------------------------------------------"
  echo "     Removing yay build folder"
  echo "----------------------------------------------------------------------"
  rm -rfv yay
fi
