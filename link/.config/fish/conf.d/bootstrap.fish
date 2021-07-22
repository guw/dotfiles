if test -f ~/.bootstrap_rc
	if functions --query bass
	    bass source ~/.bootstrap_rc
	else
	    echo "Looks like bass isn't there. Did you run _setup_fishenv? Check dotfiles setup."
	end
end