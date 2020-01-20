
" Included from https://github.com/rkm/dotfiles/blob/master/linux/.vimrc

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
