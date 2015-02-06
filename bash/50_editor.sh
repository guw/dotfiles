#!/bin/sh

# Editing

if [[ ! "$SSH_TTY" ]] && is_osx; then
  export EDITOR='subl'
else
  export EDITOR='vim'
fi

export VISUAL="$EDITOR"
alias q="$EDITOR"
alias qs="q $DOTFILES"
