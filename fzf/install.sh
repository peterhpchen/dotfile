#!/bin/bash

echo "fzf installer"

echo "Installing fzf"
# Just for zsh, add fzf
# https://github.com/junegunn/fzf/blob/master/install
"$(brew --prefix)"/opt/fzf/install --key-bindings --completion --update-rc --no-bash --no-fish

exit 0
