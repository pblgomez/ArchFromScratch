#!/usr/bin/env bash
set -e

if ! hash snapper 2>/dev/null; then
  echo "----------------------------------------------------------------------"
  echo "     Installing dependencies"
  echo "----------------------------------------------------------------------"
  sudo pacman -S --needed --noconfirm snapper snap-pac
  snapper -c root create-config /
  snapper -c home create-config /home
  systemctl start snapper-timeline.timer snapper-cleanup.timer
  systemctl enable snapper-timeline.timer snapper-cleanup.timer
fi