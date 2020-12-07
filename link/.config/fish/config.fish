

# Starship prompt
if command -v starship > /dev/null
    starship init fish | source
else
    echo "Starship prompt (https://starship.rs/) isn't installed. Check dotfiles setup."
end
