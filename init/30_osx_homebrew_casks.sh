#!/bin/sh

# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Exit if Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && e_error "Brew casks need Homebrew to install." && return 1

# Hack to show the first-run brew-cask password prompt immediately.
brew cask info this-is-somewhat-annoying 2>/dev/null


# Homebrew casks
casks=(
  # Applications
  bettertouchtool
  cloudytabs
  omnidisksweeper
  sublime-text
  vagrant
  virtualbox
  virtualbox-extension-pack
)

# Install Homebrew casks.
casks=($(setdiff "${casks[*]}" "$(brew cask list 2>/dev/null)"))
if (( ${#casks[@]} > 0 )); then
  e_header "Installing Homebrew casks: ${casks[*]}"
  for cask in "${casks[@]}"; do
    brew cask install --appdir="/Applications" $cask
  done
  brew cask cleanup
fi
