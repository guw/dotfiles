# Raspbian-only stuff. Abort if not Raspbian.
is_raspbian || return 1

# Fix language not properly set on Raspbian
export LC_ALL=C

# Package management
alias update="sudo apt-get -qq update && sudo apt-get upgrade"
alias install="sudo apt-get install"
alias remove="sudo apt-get remove"
alias search="apt-cache search"

# Make 'less' more.
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# call mosh-allow-ufw script if present
if [ -x /usr/local/bin/mosh-allow-ufw ]; then
  sudo /usr/local/bin/mosh-allow-ufw
fi
