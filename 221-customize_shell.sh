#!/usr/bin/env bash
set -e

echo "----------------------------------------------------------------------"
echo "     Customize shell"
echo "----------------------------------------------------------------------"
if [ $SHELL == /bin/zsh ]; then
  echo "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi


