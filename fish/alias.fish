################################################################################
################################################################################
## Copyright 2018 tyrolyean. Licensed under the Apache License Version 2.     ##
##                                                                            ##
## This file cointains aliases for programs, partially adding parameters to   ##
## them. Aliases for shortcuts such as ll or la are also defined here         ##
################################################################################
################################################################################

## The Following commands may be attributed to @minato4869.

# File utilitys
alias cp="cp -iv"
alias mv="mv -iv"
alias ln="ln -ivr"
alias rm="rm -iv --preserve-root"
alias chown="chown --preserve-root"
alias chmod="chmod --preserve-root"
alias chgrp="chgrp --preserve-root"

# ls functionality improvements and colorful output
alias ls="ls -Fh --color=auto"
alias ll="ls -lFh --color=auto"
alias la="ls -alh --color=auto"

# Information overrides     
alias nano="nano -lmx"    
alias ip="ip --color=auto"    
alias bc="/usr/bin/bc -l"    
alias listmeta="/usr/bin/metaflac --list"    
alias dd="/usr/bin/dd status=progress"
