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
set noerrorbells
set visualbell
set showcmd          " display incomplete commands
set incsearch        " do incremental searching
set smartcase
set hlsearch         " highlight all search results

" set the statusline
set laststatus=2
set statusline=%f

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h "help file flag
set statusline+=%r "read only flag
set statusline+=%m "modified flag

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%= "left/right separator

set statusline+=%l/%L "cursor line/total lines
set statusline+=\ %P "percent through file
set laststatus=2

" use ctrl-[hjkl] to select the active split
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-l> :wincmd l<CR>

" remember last position in a file
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" spell check
if version >= 700
  set spl=en spell
  set nospell
endif
map ^T :w!<CR>:!aspell check %<CR>:e! %<CR>

" edit the README_FOR_APP (makes :R commands work)
map <Leader>R :e doc/README_FOR_APP<CR>

" use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

filetype plugin on

" folding settings
set foldmethod=indent   " fold based on indent
set foldnestmax=10      " deepest fold is 10 levels
set nofoldenable        " dont fold by default
set foldlevel=1         " this is just what i use

