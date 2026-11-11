" ~/.vimrc

" Load Vim's defaults.vim (syntax, filetype indent, ...); a ~/.vimrc disables it.
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" --- Search ---
set hlsearch                                    " highlight all matches
set ignorecase smartcase                        " case-insensitive unless uppercase typed
" Ctrl-l: clear highlight
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

" --- UI ---
set laststatus=2                                " always show the status line

" --- Mouse ---
set mouse=a                                     " mouse in all modes
if has('mouse_sgr')
  set ttymouse=sgr                              " fix drag/wide screens in tmux
endif

" --- Indentation (filetype plugins may override, e.g. Go/Makefile use tabs) ---
set expandtab                                   " Tab key inserts spaces
set shiftwidth=4                                " indent width for >>, <<, auto-indent
set softtabstop=4                               " Tab/Backspace move by 4 spaces

" F8: toggle between spaces (4) and tabs (8)
function! ToggleTabs() abort
  if &expandtab
    setlocal noexpandtab shiftwidth=8 softtabstop=0
  else
    setlocal expandtab shiftwidth=4 softtabstop=4
  endif
  setlocal expandtab?
endfunction
nnoremap <F8> :call ToggleTabs()<CR>

" F9: toggle spell check (en_us)
nnoremap <F9> :setlocal spell! spelllang=en_us<CR>:setlocal spell?<CR>

" F10: toggle line numbers
nnoremap <F10> :set number!<CR>:set number?<CR>
