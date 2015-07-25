#!/bin/sh

# Ubuntu-only stuff. Abort if not Ubuntu.
is_ubuntu || return 1

# Install / Update Liquibase
LIQUIDPROMPT=~/.liquidprompt
if [[ ! -d $LIQUIDPROMPT ]]; then
  # $LIQUIDPROMPT directory doesn't exist? Clone it!
  e_header "Downloading liquidprompt"
  git clone --recursive git://github.com/nojhan/liquidprompt.git $LIQUIDPROMPT
else
  # Make sure we have the latest files.
  e_header "Updating liquidprompt"
  pushd $LIQUIDPROMPT >/dev/null
  git pull
  git submodule update --init --recursive --quiet
  popd >/dev/null
fi
