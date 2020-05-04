#!/bin/zsh

###############################################################################
###############################################################################
## FILE INFORMATION:                                                         ##
## This file contains all definitions and setup shit i have to do.           ##
## The functions themselves may be defined in ~/.config/zsh/functions.zsh    ##
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
## ATTRIBUTIONS:                                                             ##
## As I should probably tell you who contributed to this file and who told me##
## How to do what, I will list the most important contributors here:         ##
## minato for some functions and settings                                    ##
## dxld for explanations what the above mentioned functions actually do and  ##
##      for beeing the original author of them... wow.                       ##
###############################################################################
###############################################################################

##
#### AUTLOADS
##

# Prompt
autoload -Uz promptinit
promptinit

# Completion system
autoload -Uz compinit
compinit
# Colors
autoload -U colors; colors
# Prompt
autoload -Uz promptinit
promptinit


##
#### KEYBINDS
##

bindkey -e
bindkey "^[[3~" delete-char
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
##
#### SET VARIABLES
##

# I don't know why the fuck this doesn't work,
# but for me, it doesn't really...
EDITOR="vim"
VISUAL="vim"
setopt histignorealldups sharehistory

# If no x11 exists this is pretty useful...
PINENTRY_BINARY="/usr/bin/pinentry-curses"
GPG_TTY=$(tty)
export GPG_TTY

##
#### THINGS SO IT LOOKS NOT SO SHITTY
##

# Set window title according to command
case $TERM in
  (*xterm* | rxvt)

    # shell input
    function precmd {
      print -Pn "\e]0;zsh%L %(1j,%j job%(2j|s|); ,)%~\a"
    }

    # command running
    function preexec {
      printf "\033]0;%s\a" "$1"
    }

  ;;
esac

# Set the prompt hook
add-zsh-hook precmd prompt_precmd

set nobackup
set nowritebackup
