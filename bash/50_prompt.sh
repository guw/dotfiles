#!/bin/sh

# On OSX, source Liquibase from homebrew
if is_osx && [ -f $(brew --prefix)/share/liquidprompt ]; then
  . $(brew --prefix)/share/liquidprompt
elif [ -f ~/liquidprompt ]; 
  . ~/liquidprompt
fi
