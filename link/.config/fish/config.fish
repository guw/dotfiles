

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

# Some aliases for easier archiving
abbr tgz 'tar -cvvzf'
abbr tbz2 'tar -cvvjf'
abbr utgz 'tar -xvvzf'
abbr utbz2 'tar -xvvjf'
abbr mktar 'tar -cvvf'
abbr untar 'tar -xvvf'

# setup
function _setup_fishenv
  set packages 'direnv' 'source-highlight' 'rlwrap' 'lsd' 'colordiff' 'thefuck'
  switch (uname)
    case Darwin
      brew install $packages terminal-notifier
  end

  # fisherman
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

  # plugins
  fisher install jethrokuan/z jorgebucaran/nvm.fish

  # theme
  #fisher install IlanCosman/tide

  # tpm
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
end

# local overrides
set fish_individual_config ~/.config/fish/config_local.fish
if test -e $fish_individual_config
  source $fish_individual_config
end

# thefuck alias
if command -sq thefuck
    thefuck --alias | source
end