if test -d $HOME/.volta
    set -gx VOLTA_HOME "$HOME/.volta"
    set -gx PATH "$VOLTA_HOME/bin" $PATH
end