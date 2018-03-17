###############################################################################
###############################################################################
## FILE INFORMATION:                                                         ##
## This file contains all aliases used by the zsh.                           ##
## ATTRIBUTIONS:                                                             ##
## This file was created originally by minato, some stuff was added by me    ##
## though.                                                                   ##
## LICENSE:                                                                  ##
## Copyright © 2018 Tyrolyean                                                ##
##                                                                           ##
## This program is free software: you can redistribute it and/or modify      ##
## it under the terms of the GNU General Public License as published by      ##
## the Free Software Foundation, either version 3 of the License, or         ##
## (at your option) any later version.                                       ##
##                                                                           ##
## This program is distributed in the hope that it will be useful,           ##
## but WITHOUT ANY WARRANTY; without even the implied warranty of            ##
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the             ##
## GNU General Public License for more details.                              ##
##                                                                           ##
## You should have received a copy of the GNU General Public License         ##
## along with this program.  If not, see <http://www.gnu.org/licenses/>.     ##
###############################################################################
###############################################################################

# I don't understand why this is here...
alias sudo="sudo "

# safer commands with more output. 
alias cp="cp -iv"
alias mv="mv -iv"
alias ln="ln -iv"
alias rm="rm -iv --preserve-root"
alias chown="chown --preserve-root"
alias chmod="chmod --preserve-root"
alias chgrp="chgrp --preserve-root"

# better ls and fancy colors
alias ls="ls -Fh --color=auto"
alias ll="ls -lFh --color=auto"
alias la="ls -alh --color=auto"

# Information overrides 
alias nano="/usr/bin/nano -lmx"
alias bc="/usr/bin/bc -l"
alias listmeta="/usr/bin/metaflac --list"

#alias em="emacs -nw"
alias mg="mg -n"
#alias temacsnoconf="emacs -q -nw"
#alias term_emacs="emacsclient -t"
alias nano="nano -lm"

