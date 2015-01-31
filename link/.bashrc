# Where the magic happens.
export DOTFILES=~/.dotfiles

# Add binaries into the path
PATH=$DOTFILES/bin:$PATH
export PATH

# Source all files in "bash"
function src() {
  local file
  if [[ "$1" ]]; then
    source "$DOTFILES/bash/$1.sh"
  else
    for file in $DOTFILES/bash/*; do
      source "$file"
    done
  fi
}

# Run dotfiles script, then source.
function dotfiles() {
  $DOTFILES/bin/dotfiles "$@" && src
}

src
