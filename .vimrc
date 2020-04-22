" Global setting
:set hlsearch                           " highlight search
:set laststatus=2                       " Always show the statusline
:set mouse=a
:set tabstop=4 expandtab shiftwidth=4

" Return to last edit position when opening files
augroup ReturnLastEdited
    autocmd!
    autocmd BufReadPost *
         \ if line("'\"") > 0 && line("'\"") <= line("$") |
         \   exe "normal! g`\"" |
         \ endif
augroup END

" Map <F8> to toggle tabs to spaces
let g:taboptions = 'on'
function! ToggleTabsToSpaces()
    if g:taboptions == 'off'
        " set nolist
        set expandtab
        set tabstop=4
        set shiftwidth=4
        let g:taboptions = 'on'
        echo "expandtab=on"
    else
        " set list
        set noexpandtab
        set tabstop=8
        set shiftwidth=8
        let g:taboptions = 'off'
        echo "expandtab=off"
    endif
endfunction
map <F8> :call ToggleTabsToSpaces()<CR>

" Map <F9> to toggle speel check
let g:myLang = 0
function! ToogleSpellCheck()
    if g:myLang == 0
        set spell spelllang=en_us
        let g:myLang = 1
        echo "set spell spelllang=en_us"
    else
        set spell nospell
        let g:myLang = 0
        echo "set spell nospell"
    endif
endfunction
map <F9> :call ToogleSpellCheck()<CR>

" Map <F10> to toggle line number
let g:myNum = 0
function! ToogleNumber()
    if g:myNum == 0
        set number
        let g:myNum = 1
        echo "set number"
    else
        set nonumber
        let g:myNum = 0
        echo "set nonumber"
    endif
endfunction
map <F10> :call ToogleNumber()<CR>
