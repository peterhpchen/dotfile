#!/bin/zsh

source "$DOTS/zsh/packages/zsh-history-substring-search/zsh-history-substring-search.zsh"

# https://github.com/zsh-users/zsh-history-substring-search#usage
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
