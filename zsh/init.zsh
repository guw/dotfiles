# the install dir
LIQUIDZ_DIR=${0:a:h}

source "${LIQUIDZ_DIR}/checks.zsh"
source "${LIQUIDZ_DIR}/setoptions.zsh"
source "${LIQUIDZ_DIR}/history.zsh"
source "${LIQUIDZ_DIR}/exports.zsh"
source "${LIQUIDZ_DIR}/aliases.zsh"
source "${LIQUIDZ_DIR}/keybindings.zsh"

# liquidprompt
if [ -f $(brew --prefix)/share/liquidprompt ]; then
  . $(brew --prefix)/share/liquidprompt
fi

# completions
export FPATH="$(brew --prefix)/share/zsh-completions:$(brew --prefix)/share/zsh/site-functions:$FPATH"
zstyle ':completion:*' completer _expand _complete _ignored _approximate
#zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
autoload -Uz compinit
compinit


# allow hooking into functions
autoload -Uz add-zsh-hook

# set tab title to cwd
function set-tab-window-titles {
  tab_label=${PWD/${HOME}/\~} # use 'relative' path
  echo -ne "\e]2;${tab_label}\a" # set window title to full string
  echo -ne "\e]1;${tab_label: -24}\a" # set tab title to rightmost 24 characters
}
add-zsh-hook precmd set-tab-window-titles

