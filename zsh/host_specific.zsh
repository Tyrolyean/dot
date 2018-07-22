alias mirror_sync_local="rsync -rtlvh --progress --delete-after rsync://slipknot/archlinux /srv/data/mirror"
alias mirror_sync_extern="rsync -rtlvh --progress --delete-after --bwlimit=1000 rsync://slipknot.tyrolyean.net/archlinux /srv/data/mirror"
alias music_sync_extern="rsync -rtlvh --progress rsync://www.tyrolyean.net/music/ /home/tyrolyean/music"
alias music_sync_intern="rsync -rtlvh --progress rsync://slipknot/music/ /home/tyrolyean/music"
