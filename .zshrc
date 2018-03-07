# Set up the prompt

autoload -Uz promptinit
promptinit
#prompt redhat

setopt histignorealldups sharehistory

alias extern
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/functions.zsh
set +x
# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e
bindkey "^[[3~" delete-char
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

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

# I don't know why the fuck this doesn't work,
# but for me, it doesn't really...
EDITOR="vim"
VISUAL="vim"

# Echo debug at start
echo -e "shell start at $(date --rfc-3339=seconds)"

# Old custom prompts. now delegated to the functions.zsh file
#PROMPT="[%F{red}%n%f@%F{cyan}%m%f %1~]%(#.#.$) " $shorthost
#PROMPT="[%F{red}%n%f@%f %1~]%(#.#.$) "
#RPROMPT='[%F{yellow}%?%f]'

# Set window title accordingly
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
