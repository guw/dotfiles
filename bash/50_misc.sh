# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# colorful grep
alias grep='grep --color=auto'

# Prevent less from clearing the screen while still showing colors.
export LESS=-XR

# Set the terminal's title bar.
function titlebar() {
  echo -n $'\e]0;'"$*"$'\a'
}

# SSH auto-completion based on entries in known_hosts.
if [[ -e ~/.ssh/known_hosts ]]; then
  complete -o default -W "$(cat ~/.ssh/known_hosts | sed 's/[, ].*//' | sort | uniq | grep -v '[0-9]')" ssh scp sftp
fi

# Disable ansible cows }:]
export ANSIBLE_NOCOWS=1

# geek weather for terminal
function weather()
{
    local defaultcity=${LOCATION_LOCALITY-Apolda}
    local request="wttr.in/${1-$defaultcity}?${2-m1F}"
    [ "$COLUMNS" -lt 125 ] && request+='n'
    curl -H "Accept-Language: ${LANG%_*}" --compressed "$request"
}

# allow **/ globbing
shopt -s globstar
