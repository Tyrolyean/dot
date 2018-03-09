#!/usr/bin/zsh


################################################################################
## This file contains user defined functions for whatever purpose. the        ##
## function calls have been offloaded to ~/.config/zsh/definitions.zsh        ##
##                                                                            ##
## This is 99% copied from dxld 2018/03/07                                    ##
## LICENSE:                                                                   ##
## Copyright © 2018 Tyrolyean                                                 ##
## This program is free software: you can redistribute it and/or modify       ##
## it under the terms of the GNU General Public License as published by       ##
## the Free Software Foundation, either version 3 of the License, or          ##
## (at your option) any later version.                                        ##
##                                                                            ##
## This program is distributed in the hope that it will be useful,            ##
## but WITHOUT ANY WARRANTY; without even the implied warranty of             ##
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              ##
## GNU General Public License for more details.                               ##
##                                                                            ##
## You should have received a copy of the GNU General Public License          ##
## along with this program.  If not, see <http://www.gnu.org/licenses/>.      ##
##                                                                            ##
################################################################################

# returns the given string in color.
# the color is calculated from a "hash".
color_from_hash () {

        local host_chars hash colors
        host_chars=${(s::)1}
        colors=(
                $fg[cyan]    $fg_bold[green]
                $fg[white]   $fg_bold[red]
                $fg[yellow]  $fg_bold[blue]
                $fg[magenta] $fg_bold[magenta]
                $fg[blue]    $fg_bold[yellow]
                $fg[red]     $fg_bold[white]
                $fg[green]   $fg_bold[cyan]
        )

        hash=0
    
        for c in $host_chars; do
                hash=$(( $hash ^ 36#$c ))
        done
        hash=$(( ( $hash % $#colors ) + 1 ))
        
        echo -n "%{$colors[$hash]%}$1%{$reset_color%}"
}

# This is called by the zsh because of the hook set
# in the definitions file
prompt_precmd () {

        local return_code="%(?..%{$fg_bold[red]%}%? ↵%{$reset_color%})"
        local shorthost=$(color_from_hash $(hostname -s))
        local usrnme=$(color_from_hash $(whoami))
        local tty_colorless=$( echo ${$(tty)#"/dev/"} | tr -d / )
        local tty_col=$(color_from_hash "$tty_colorless" )
        setopt prompt_subst

    
        PROMPT="%F{red}${usrnme}%f@${shorthost}%f@${tty_col} %3~ > "
        RPROMPT='[%F{yellow}%?%f]'
}

