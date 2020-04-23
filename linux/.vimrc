
" Included from https://github.com/rkm/dotfiles/blob/master/linux/.vimrc

" XDG_CONFIG_HOME setup
set backupdir=$XDG_DATA_HOME/vim/backup
set directory=$XDG_DATA_HOME/vim/swap
set runtimepath=$XDG_CONFIG_HOME/vim,$VIMRUNTIME,$XDG_CONFIG_HOME/vim/after
set undodir=$XDG_DATA_HOME/vim/undo
set viewdir=$XDG_DATA_HOME/vim/view
set viminfo+='1000,n$XDG_DATA_HOME/vim/viminfo

" Tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Column rulers
execute "set colorcolumn=80,88"
execute "highlight ColorColumn ctermbg=darkgrey"

" TODO snippet
function TODO()
    return "# TODO(rkm " . strftime("%Y-%m-%d") . ")"
endfunction
iabbrev <expr> todo# TODO()

" Misc.
set autoread
