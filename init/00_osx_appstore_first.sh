#!/bin/sh

# OSX-only stuff. Abort if not OSX.
is_osx || return 1

cat <<HELP
Install all AppStore Apps at first!

There is no solution to automate AppStore installs. Please go to 
there and install all apps.

HELP
# no solution to automate AppStore installs
read -p "Press any key to continue... " -n1 -s
echo  '\n'

