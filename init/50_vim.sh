#!/bin/sh

# Backups, swaps and undos are stored here.
mkdir -p ~/.caches/vim

# Download Vim plugins.
if [[ "$(type -P vim)" ]]; then
  vim +PlugUpgrade +PlugUpdate +qall
fi
