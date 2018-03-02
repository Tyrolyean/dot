# Edited by rbo as of 2018/01/05
alias sudo="sudo "

#safer commands
alias cp="cp -iv"
alias mv="mv -iv"
alias ln="ln -iv"
alias rm="rm -iv --preserve-root"
alias chown="chown --preserve-root"
alias chmod="chmod --preserve-root"
alias chgrp="chgrp --preserve-root"

#better ls
alias ls="ls -Fh --color=auto"
alias ll="ls -lFh --color=auto"
alias la="ls -alh --color=auto"

#alias em="emacs -nw"
alias mg="mg -n"
#alias temacsnoconf="emacs -q -nw"
#alias term_emacs="emacsclient -t"
alias nano="/usr/bin/nano -lmx"
alias bc="/usr/bin/bc -l"
alias listmeta="/usr/bin/metaflac --list"

# Killed as of 2018/01/05
#switch kblayouts
#alias kbus="setxkbmap us altgr-intl -option ctrl:nocaps && notify-send kb_layout=US"
#alias kbde="setxkbmap de -option ctrl:nocaps && notify-send kb_layout=DE"

#misc
#alias weather_innsbruck="curl wttr.in/Innsbruck"
#alias weather_moon="curl wttr.in/Moon"
#alias thermal_monitor="watch -n 1 -d sensors"

alias mirror_sync_local="rsync -rtlvh --progress --delete-after rsync://192.168.222.1/archlinux /srv/data/mirror"
alias mirror_sync_extern="rsync -rtlvh --progress --delete-after --bwlimit=1000 rsync://mirror.tyrolyean.net/archlinux /srv/data/mirror"
alias music_sync_extern="rsync -rtlvh --progress rsync://www.tyrolyean.net/flac /home/tyrolyean/music"
alias music_sync_intern="rsync -rtlvh --progress rsync://192.168.222.1/flac /home/tyrolyean/music"

