#!/bin/sh

# OSX-only stuff. Abort if not OSX.
is_osx || return 1

mkdir -p ${HOME}/.ssh
cat <<EOF > ${HOME}/.ssh/README-keychain-macOS
For macOS SSH support
=====================

https://github.com/jirsbek/SSH-keys-in-macOS-Sierra-keychain

In ~/.ssh create config file with the following content:

Host * (asterisk for all hosts or add specific host)
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile <key> (e.g. ~/.ssh/userKey)

EOF
