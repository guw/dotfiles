#!/bin/sh

# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Install Homebrew.
if [[ ! "$(type -P brew)" ]]; then
  e_header "Installing Homebrew"
  sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if [[ -x "/opt/homebrew/bin/brew" ]]; then
    eval $(/opt/homebrew/bin/brew shellenv)
  elif [[ -x "/usr/local/bin/brew" ]]; then
    eval $(/usr/local/bin/brew shellenv)
  else
    e_error "Installing Homebrew failed!"
    return 1
  fi
fi

# Exit if, for some reason, Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && e_error "Homebrew failed to install." && return 1

e_header "Updating Homebrew"
brew doctor
brew update --force

# Functions used in subsequent init scripts.

# Tap Homebrew kegs.
function brew_tap_kegs() {
  kegs=($(setdiff "${kegs[*]}" "$(brew tap)"))
  if (( ${#kegs[@]} > 0 )); then
    e_header "Tapping Homebrew kegs: ${kegs[*]}"
    for keg in "${kegs[@]}"; do
      brew tap $keg
    done
  fi
}

# Install Homebrew recipes.
function brew_install_recipes() {
  recipes=($(setdiff "${recipes[*]}" "$(brew list --formula)"))
  if (( ${#recipes[@]} > 0 )); then
    e_header "Installing Homebrew recipes: ${recipes[*]}"
    for recipe in "${recipes[@]}"; do
      brew install $recipe
    done
  fi
}

# Ensure the kegs are installed.
kegs=(
  homebrew/cask
  homebrew/cask-fonts
)
brew_tap_kegs

# Install recipes
recipes=(
  #ansible
  brew-gem
  cowsay
  fish
  font-meslo-lg-nerd-font
  git
  git-extras
  htop
  id3tool
  jq
  lesspipe
  liquidprompt
  locateme
  man2html
  mackup
  maven
  menumeters
  #mosh
  nmap
  nvm
  omnidisksweeper
  ssh-copy-id
  starship
  sublime-text
  terminal-notifier
  timelimit
)
brew_install_recipes

# Misc cleanup!

# This is where brew stores its binary symlinks
local binroot="$(brew --config | awk '/HOMEBREW_PREFIX/ {print $2}')"/bin

# htop
if [[ "$(type -P $binroot/htop)" ]] && [[ "$(stat -L -f "%Su:%Sg" "$binroot/htop")" != "root:wheel" || ! "$(($(stat -L -f "%DMp" "$binroot/htop") & 4))" ]]; then
  e_header "Updating htop permissions"
  sudo chown root:wheel "$binroot/htop"
  sudo chmod u+s "$binroot/htop"
fi

# set fish as default shell
if [[ "$(type -P $binroot/fish)" && "$(cat /etc/shells | grep -q "$binroot/fish")" ]]; then
  e_header "Adding $binroot/fish to the list of acceptable shells"
  echo "$binroot/fish" | sudo tee -a /etc/shells >/dev/null
fi
if [[ "$(dscl . -read ~ UserShell | awk '{print $2}')" != "$binroot/fish" ]]; then
  e_header "Making $binroot/fish your default shell"
  sudo chsh -s "$binroot/fish" "$USER" >/dev/null 2>&1
  e_arrow "Please exit and restart all your shells."
fi
