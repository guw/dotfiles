#!/bin/sh

# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# APPLE, Y U PUT /usr/bin before /usr/local/bin?!
PATH="/usr/local/bin:$(path_remove /usr/local/bin)"
PATH="/usr/local/sbin:$(path_remove /usr/local/sbin)"
export PATH

# Make 'less' more.
[[ "$(type -P lesspipe.sh)" ]] && eval "$(lesspipe.sh)"

# Start ScreenSaver. This will lock the screen if locking is enabled.
#alias ss="open /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app"

# Configure Bash completion from Homebrew
if [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]]; then
	export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
  source "/usr/local/etc/profile.d/bash_completion.sh"
else
  e_error "Homebrew's bash-completion@2 not installed (/usr/local/etc/profile.d/bash_completion.sh not found)"
fi

# Java on OS X
export JAVA_HOME=$(/usr/libexec/java_home)

# configure nvm if available
nvmsh="$(brew --prefix nvm)/nvm.sh"
if [ -f "$nvmsh" ] ; then
  export NVM_DIR="$HOME/.nvm"
  . "$nvmsh"
fi
