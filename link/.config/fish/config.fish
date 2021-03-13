

# Starship prompt
if command -sq starship
    starship init fish | source
else
    echo "Starship prompt (https://starship.rs/) isn't installed. Check dotfiles setup."
end

# thefuck setup
if command -sq thefuck
    thefuck --alias | source
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

  # fisherman
  #   plugins:
  #     jethrokuan/z jorgebucaran/nvm.fish
  #   theme
  #     IlanCosman/tide
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

  # everything should be there already
  fisher update
end

# local overrides
set fish_individual_config ~/.config/fish/config_local.fish
if test -e $fish_individual_config
  source $fish_individual_config
end

