#!/bin/sh

# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Exit if Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && e_error "Brew casks need Homebrew to install." && return 1

# Ensure the cask keg and recipe are installed.
kegs=(caskroom/cask caskroom/versions)
brew_tap_kegs
recipes=(brew-cask)
brew_install_recipes

# Exit if, for some reason, cask is not installed.
[[ ! "$(brew ls --versions brew-cask)" ]] && e_error "Brew-cask failed to install." && return 1

# Hack to show the first-run brew-cask password prompt immediately.
brew cask info this-is-somewhat-annoying 2>/dev/null


# Homebrew casks
casks=(
  # Applications
  bettertouchtool
  burn
  chronosync
  cloudytabs
  commander-one
  #cyberduck
  dockertoolbox
  dropbox
  flux
  #google-chrome ## -> need to install manuall, otherwise 1 password ext fails
  google-drive
  iterm2
  java
  java7
  yujitach-menumeters
  omnidisksweeper
  picasa
  sequel-pro
  skype
  sourcetree
  sublime-text3
  vagrant
  #vmware-fusion ## -> vmware fusion policy sucks, going to El Capitan requires to buy 8 because of USB issues
  virtualbox
  virtualbox-extension-pack
  # Quick Look plugins
  betterzipql
  qlcolorcode
  qlmarkdown
  qlprettypatch
  qlstephen
  quicklook-csv
  quicklook-json
  quicknfo
  suspicious-package
  webpquicklook
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
