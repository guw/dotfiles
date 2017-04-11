# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
      . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# source location specific profiles if they exists
if [ -z "${LOCATION_COUNTRY}" ]; then
  if [ -f "${HOME}/.profile_OTHER" ]; then
    echo -e "\e[3mUnable to identify location. Falling back to defaults.\e[0m"
    . "${HOME}/.profile_OTHER"
  fi
else
        echo -e "Welcome to \e[1m${LOCATION_LOCALITY:-}\e[0m."
  if [ -f "${HOME}/.profile_${LOCATION_LOCALITY_SHORT:-}" ]; then
    . "${HOME}/.profile_${LOCATION_LOCALITY_SHORT:-}"
  elif [ -f "${HOME}/.profile_${LOCATION_COUNTRY}_${LOCATION_STATE:-}" ]; then
    . "${HOME}/.profile_${LOCATION_COUNTRY}_${LOCATION_STATE:-}"
  elif [ -f "${HOME}/.profile_${LOCATION_COUNTRY}" ]; then
    . "${HOME}/.profile_${LOCATION_COUNTRY}"
  elif [ -f "${HOME}/.profile_OTHER" ]; then
    . "${HOME}/.profile_OTHER"
  fi
fi
