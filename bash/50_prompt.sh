#!/bin/sh

# On OSX, source Liquibase from homebrew
if is_osx && [ -f $(brew --prefix)/share/liquidprompt ]; then
  . $(brew --prefix)/share/liquidprompt
elif [ -f ~/.liquidprompt ]; then
  . ~/.liquidprompt
elif [ -f ~/.liquidprompt/liquidprompt ]; then
  . ~/.liquidprompt/liquidprompt
fi

# Something for orientation
alias cls='clear;echo "Logged in at $(tty), as $(whoami) in $(pwd)."'
