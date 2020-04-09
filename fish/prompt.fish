################################################################################
################################################################################
## Copyright 2018 tyrolyean. Licensed under the Apache License Version 2.     ##
##                                                                            ##
## This file cointains functions used to create the left and right prompt.    ##
################################################################################
################################################################################

# Define the pwd length for each directory except .
set -x fish_prompt_pwd_dir_length 6

# Function executed when the prompt is rendered
function fish_prompt

	# Set environment variables to desired values
	
	# output the current user
	set_color_term (color_from_string (whoami))
	echo -n (whoami)
	set_color_term normal
	echo -n "@"
	# output the current hostname
	set_color_term (color_from_string (hostname))
	echo -n (hostname)
	set_color_term normal
	echo -n "@"
	# output the current tty device
	set_color_term (color_from_string (tty))
	echo -n (tty | string replace "/dev/" "" | string replace "/" "" )
	set_color_term normal
	echo -n " "
	

	echo  -n (prompt_pwd) "> "

end

function fish_right_prompt
	

	set progval $status

	if not isatty 1
		
		echo -n "["
		
		if [ $progval != 0 ]
			set_color_term red
		else
			set_color_term green

		end
		echo -n $progval
		set_color_term normal
		
		echo "|"
		set duration (echo "$CMD_DURATION 1000" | awk '{printf "%.3fs", $1 / $2}')
		echo $duration
		echo "]"

	end
end
