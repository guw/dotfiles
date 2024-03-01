
# Homebrew path on macOS Silicon
if test -f /opt/homebrew/bin/brew
  eval (/opt/homebrew/bin/brew shellenv)
end

# Homebrew path on macOS Intel
if test -f /usr/local/bin/brew
  eval (/usr/local/bin/brew shellenv)
end

# Starship prompt
if command -sq starship
    starship init fish | source
else
    echo "Starship prompt (https://starship.rs/) isn't installed. Check dotfiles setup."
end


# Editor
if command -sq code
    set -x EDITOR "code --wait --new-window"
else if command -sq subl
    set -x EDITOR "subl -n -w"
else
    set -x EDITOR vim
end
set -x VISUAL $EDITOR


# setup
function _setup_fishenv
  set packages 'direnv' 'source-highlight' 'rlwrap' 'lsd' 'colordiff' 'thefuck'
  switch (uname)
    case Darwin
      brew install $packages terminal-notifier
  end

  # fisher
  #   plugins:
  #     jorgebucaran/fisher jethrokuan/z jorgebucaran/nvm.fish
  #   theme
  #     IlanCosman/tide
  curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

  # everything should be there already
  fisher install jethrokuan/z
  fisher install jorgebucaran/nvm.fish
  fisher install edc/bass
  fisher oh-my-fish/plugin-foreign-env
end

# English everywhere
set --global --export LANG en_US.UTF-8

# local overrides
set fish_individual_config ~/.config/fish/config_local.fish
if test -e $fish_individual_config
  source $fish_individual_config
end
