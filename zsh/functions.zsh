#!/usr/bin/zsh


# This is 99% copied from dxld 2018/03/07
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

prompt_precmd () {
    local return_code="%(?..%{$fg_bold[red]%}%? ↵%{$reset_color%})"
    # local return_code="%(?..%{$fg[red]%}%? <-%{$reset_color%})"
    local shorthost=$(color_from_hash $(hostname -s))
    local usrnme=$(color_from_hash $(whoami))
    setopt prompt_subst

    #PROMPT="%{$fg_bold[red]%}➜ %{$reset_color%}$shorthost %{$fg_bold[blue]%}%~ %{$reset_color%}${vcs_info_msg_0_}%{$fg_bold[blue]%} %{$reset_color%}"
    
    PROMPT="[%F{red}${usrnme}%f@${shorthost}%f %1~]%(#.#.$) "

    # Originals from dxld, minato
    #PROMPT="%{$fg_bold[red]%}> %{$reset_color%}$shorthost %{$fg_bold[blue]%}%~ %{$reset_color%}${vcs_info_msg_0_}%{$fg_bold[blue]%} %{$reset_color%}"
    #RPROMPT="%{$fg[green]%}%c%{$reset_color%} ${return_code}"
    RPROMPT='[%F{yellow}%?%f]'
}

# Mandatory for the colors to work
autoload -U colors; colors
add-zsh-hook precmd prompt_precmd

