#!/bin/sh

# set iTerm tab title to current working directory
if is_ssh; then
  PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: $(basename $PWD)\007"'
else
	PROMPT_COMMAND='echo -ne "\033]0;$(basename $PWD)\007"'
fi

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

# make mash flush to the history immediately
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
