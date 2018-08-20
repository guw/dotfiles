#!/bin/sh

# On OSX, source bash-completion from homebrew
if is_osx && [ -d $(brew --prefix)/etc/bash_completion.d ]; then
  for completion_file in $(brew --prefix)/etc/bash_completion.d/*; do
    source "$completion_file"
  done
fi