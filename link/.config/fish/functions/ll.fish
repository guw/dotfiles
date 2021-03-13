#
# These are very common and useful
#
function ll --description "List contents of directory using long format"
    if command -sq lsd
    	lsd -lh $argv
    else
    	ls -lh $argv
    end
end
