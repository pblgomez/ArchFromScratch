#!/usr/bin/env bash
set -e

echo "----------------------------------------------------------------------"
echo "     Installing i3"
echo "----------------------------------------------------------------------"
yay -S --needed --noconfirm i3-gaps rxvt-unicode dmenu rxvt-unicode-terminfo i3status
