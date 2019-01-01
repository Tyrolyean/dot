################################################################################
################################################################################
## Copyright 2018 tyrolyean. Licensed under the Apache License Version 2.     ##
##                                                                            ##
## This file cointains defintions of global variables used in the rest of the ##
## shell scripts. These may be created using functions defined in the         ##
## functions.fish file.                                                       ##
##                                                                            ##
################################################################################
################################################################################

## Sets the program for hasing text and generating a color value from it

if not set -q COLOR_HASH_PROG
	
	set COLOR_HASH_PROGS md5sum cksum shasum sha1sum sha256sum sha512sum

	for i in $COLOR_HASH_PROGS
		if type -q $i
			set -x COLOR_HASH_PROG $i
			break
		else
			log "Color hashing prog $i not found on system!"
		end
	end
	
	if not set -q COLOR_HASH_PROG
		log "No appropriate color hashing function found!"
		log "No color used"
	else
		log "Using $COLOR_HASH_PROG as color hashing program"

	end

else
	log "Using predefined COLOR_HASH_PROG: $COLOR_HASH_PROG"
end

# Go into vi mode
fish_vi_key_bindings

# Enable reverse search
function reverse_history_search
  history | fzf --no-sort | read -l command
  if test $command
    commandline -rb $command
  end
end
bind \cr reverse_history_search

# Editor variables

set -x VISUAL vim
set -x EDITOR vim

# Make less look better
set -x LESS "-R"

if begin isatty 1; and type -q most ;end
	
	# If available use most to render man pages.
	set -x PAGER most

	log "Setting pager to most"

else if isatty 1
	# In case the terminal is a tty make less have colors
	log "Setting less to have colors"
	
	set -x LESS_TERMCAP_mb \e'[1;32m'   # start blink
	set -x LESS_TERMCAP_md \e'[1;32m'   # start bold
	set -x LESS_TERMCAP_me \e'[0m'      # turn off bold, blink and underline
	set -x LESS_TERMCAP_se \e'[0m'      # stop standout
	set -x LESS_TERMCAP_so \e'[01;33m'  # start standout (reverse video)
	set -x LESS_TERMCAP_ue \e'[0m'      # stop underline
	set -x LESS_TERMCAP_us \e'[1;4;31m' # start underline
end
