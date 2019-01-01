################################################################################
################################################################################
## Copyright 2018 tyrolyean. Licensed under the Apache License Version 2.     ##
##                                                                            ##
## This file cointains helper functions used inside other shell scripts.      ##
## This file doesn't contain functions used for specific tasks, functions for ##
## users to execute or functions for shell tasks like prompts etc.            ##
##                                                                            ##
################################################################################
################################################################################

# This sets the color to a desired value if the script is executed in a shell
function set_color_term

	if not isatty 1
		set_color $argv
	end
end

# Hashes the given string and creates a color from it in the maximum possible
# color space.
function color_from_string
	if set -q COLOR_HASH_PROG
		set colval (echo -n $argv | eval $COLOR_HASH_PROG - |\
			string sub -s 1 -l 6  )
		echo $colval
	else
		echo normal
	end
end

function log
	echo -n "[" (date -Iseconds) "] "
	echo $argv
end
