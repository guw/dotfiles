

# Starship prompt
if command -v starship > /dev/null
    starship init fish | source
else
    echo "Starship prompt (https://starship.rs/) isn't installed. Check dotfiles setup."
end

# NVM (https://medium.com/@joshuacrass/nvm-on-mac-for-fish-users-e00af124c540)
function nvm
   bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end

set -x NVM_DIR ~/.nvm
nvm use default --silent
