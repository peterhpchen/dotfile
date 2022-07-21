#!/bin/sh

DOTFILES="$HOME/.dotfiles"
XDG_CONFIG_HOME="$HOME/.config"
REMOTE=https://github.com/peterhpchen/dotfiles.git

NVM_DIR="$XDG_CONFIG_HOME/nvm"

if [ ! "$(command -v brew)" ]; then
  echo "Homebrew not installed. Installing."
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
fi

if [ ! "$(command -v git)" ]; then
  echo "Git not installed. Installing."
  brew install git
fi

if [ ! -f "$NVM_DIR/nvm.sh" ]; then
  echo "NVM not installed. Installing."
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR" || exit 1
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
  . "$NVM_DIR/nvm.sh"
fi

nvm install 'lts/*'

if [ -d "$DOTFILES" ]; then
  echo "The \$DOTFILES folder already exists ($DOTFILES). Please remove it."
  exit 1
fi

git clone --quiet "$REMOTE" "$DOTFILES"

ln -s "$DOTFILES/Brewfile" "$HOME"
brew bundle

ln -s "$DOTFILES/.zshrc" "$HOME"
ln -s "$DOTFILES/.zshenv" "$HOME"
