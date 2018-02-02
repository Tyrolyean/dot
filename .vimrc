set runtimepath+=/var/dot/.vim_runtime

source /var/dot/.vim_runtime/vimrcs/basic.vim
source /var/dot/.vim_runtime/vimrcs/filetypes.vim
source /var/dot/.vim_runtime/vimrcs/plugins_config.vim
source /var/dot/.vim_runtime/vimrcs/extended.vim
source /var/dot/.vim_runtime/vimrcs/custom.vim

try
source /var/dot/.vim_runtime/my_configs.vim
catch
endtry
