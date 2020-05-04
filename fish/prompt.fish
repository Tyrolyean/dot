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
	ty_set_color_term (ty_color_from_string (whoami))
	echo -n (whoami)
	ty_set_color_term normal
	echo -n "@"
	# output the current hostname
	ty_set_color_term (ty_color_from_string (hostname))
	echo -n (hostname)
	ty_set_color_term normal
	echo -n "@"
	# output the current tty device
	ty_set_color_term (ty_color_from_string (tty))
	echo -n (tty | string replace "/dev/" "" | string replace "/" "" )
	ty_set_color_term normal
	echo -n " "
	

	echo  -n (prompt_pwd) "> "

end

function fish_right_prompt
	

	set progval $status

	if not isatty 1
		
		echo -n "["
		
		if [ $progval != 0 ]
			ty_set_color_term red
		else
			ty_set_color_term green

		end
		echo -n $progval
		ty_set_color_term normal
		
		echo "|"
		set duration (echo "$CMD_DURATION 1000" | awk '{printf "%.3fs", $1 / $2}')
		echo $duration
		echo "]"

	end
end
