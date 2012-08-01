set guifont=Monaco:h12
set runtimepath^=~/.vim/bundle/ctrlp.vim

highlight OverLength ctermbg=red ctermfg=white guibg=#ffbaba
match OverLength /\%81v.\+/
" set colorcolumn=80

" I use line lengths of 100 chars, and I like to split
" vertically, plus some breathing room
set columns=220

" taglist plugin settings
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_Auto_Update = 0
let Tlist_WinWidth = 40
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
nmap <silent> <c-t> :TlistToggle<CR>
