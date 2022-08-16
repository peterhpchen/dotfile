#!/bin/zsh

DIRCOLORS_FILE="$DOTFILES/dircolors/nord-dircolors/src/dir_colors"

if [ -r "$DIRCOLORS_FILE" ]; then
  eval $(gdircolors --bourne-shell "$DIRCOLORS_FILE")
fi
