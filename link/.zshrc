
if [ -f /Users/gwagenknecht/.ansible/env.sh ]; then
    . /Users/gwagenknecht/.ansible/env.sh
    # To disable ansible, comment out, but do not delete the following:
    activate_ansible
fi

# Only load liquidprompt in interactive shells, not from a script or from scp
echo $- | grep -q i 2>/dev/null && . /usr/share/liquidprompt/liquidprompt

