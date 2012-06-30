" Ryan's vimrc file

set nocompatible     " turns off system-dependant behavior and sticks with vim behavior

" see https://github.com/tpope/vim-pathogen
call pathogen#infect()

" set behavior commands
set nowrap           " dont wrap long lines
set nobackup         " turn off file backups
set nowritebackup
set splitright
set list listchars=tab:»·,trail:·

" set display options
set background=light
set tabstop=2        " tabs are set to be 2 spaces in width
set shiftwidth=2
set expandtab        " insert spaces instead of tabs
set autoindent       " auto-indent should be on
set smartindent
set backspace=2
set showmatch
syntax on            " automatically display files with syntax coloring on

set ruler            " display cursor position while editing
set noerrorbells     " I hate noise
set visualbell
set showcmd          " display incomplete commands
set incsearch        " do incremental searching

" use ctrl-[hjkl] to select the active split
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-l> :wincmd l<CR>

" remember last position in a file
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" allow for spell checking
map ^T :w!<CR>:!aspell check %<CR>:e! %<CR>
" setlocal spell spelllang=en_us

" Edit the README_FOR_APP (makes :R commands work)
map <Leader>R :e doc/README_FOR_APP<CR>

" Map autocomplete to tab
" imap <Tab> <C-P>

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

filetype plugin on

"augroup myfiletypes
"  autocmd!
"  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
"augroup END

" context-aware color schemes
"let &t_Co=256        " tell Vim we actually support 256 colors
"colo default
"autocmd! BufEnter,BufNewFile *.rb,*.rake colo beauty256
"autocmd! BufLeave *.rb,*.rake colo default

" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

