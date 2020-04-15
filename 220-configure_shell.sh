#!/usr/bin/env bash
set -e

echo "----------------------------------------------------------------------"
echo "     Selecting shell"
echo "----------------------------------------------------------------------"
if [ -f /usr/bin/zsh ] && [ $SHELL != /usr/bin/zsh ]; then
  chsh -s $(cat /etc/shells | grep zsh | head -n1)
fi