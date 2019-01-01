################################################################################
################################################################################
## Copyright 2018 tyrolyean. Licensed under the Apache License Version 2.     ##
##                                                                            ##
## This file cointains functions used to create the left and right prompt.    ##
################################################################################
################################################################################

# Function executed when the prompt is rendered
function fish_prompt
	
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
	set cwd_int (pwd | string split "/")
	
	set cwd $cwd_int[2..(count $cwd_int)]

	set dircnt (count $cwd)

	if [ $dircnt -lt 1 ]
		set dircnt $dircnt + 1
	end

	set dirout ""
	set MAX_DIRCNT 3

	if [ $dircnt -le $MAX_DIRCNT ]
		# Print all directories
		
		set dirout (pwd)

	else
		for i in $cwd[(math $dircnt - $MAX_DIRCNT + 1)..$dircnt]
			set dirout $dirout$i/
		end


	end

	echo  -n $dirout "> "

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
		
		echo "]"

	end
end
