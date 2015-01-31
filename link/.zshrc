#!/bin/zsh

# Liquidz
if [ -f ${HOME}/.liquidz/init.zsh ]; then
   . ${HOME}/.liquidz/init.zsh
fi

# Ruby via Homebrew (http://www.createdbypete.com/articles/ruby-on-rails-development-setup-for-mac-osx/)
eval "$(rbenv init -)"

# added by travis gem
[ -f /Users/gunnar.wagenknecht/.travis/travis.sh ] && source /Users/gunnar.wagenknecht/.travis/travis.sh

