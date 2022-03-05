
# Homebrew path on macOS
if test -f /opt/homebrew/bin/brew
  eval (/opt/homebrew/bin/brew shellenv)
end


# Starship prompt
if command -sq starship
    starship init fish | source
else
    echo "Starship prompt (https://starship.rs/) isn't installed. Check dotfiles setup."
end


# Editor
if command -sq subl
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

# local overrides
set fish_individual_config ~/.config/fish/config_local.fish
if test -e $fish_individual_config
  source $fish_individual_config
end

