#!/bin/sh

# On OSX, source bash-completion from homebrew
if is_osx && [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
  . $(brew --prefix)/share/bash-completion/bash_completion
fi
