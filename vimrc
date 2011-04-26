" Ryan's vimrc file

" set behavior commands
set nocompatible     " turns off system-dependant behavior and sticks with vim behavior
set nowrap           " dont wrap long lines
set nobk             " turns off file backups (they clutter things up!)

" set display options
set tabstop=3        " tabs are set to be 3 spaces in width
set shiftwidth=3
set noexpandtab      " insert tabs instead of spaces
set autoindent			" auto-indent should be on
set smartindent
set backspace=2
syntax on				" automatically display files with syntax coloring on

set ruler				" display cursor position while editing
set noerrorbells		" I hate noise
set showcmd				" display incomplete commands

" remember last position in a file
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" allow for spell checking
map ^T :w!<CR>:!aspell check %<CR>:e! %<CR>

augroup myfiletypes
	autocmd!
	autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END

