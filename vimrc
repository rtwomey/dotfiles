" Ryan's vimrc file

set nocompatible     " turns off system-dependant behavior and sticks with vim behavior

" see https://github.com/tpope/vim-pathogen
call pathogen#infect()
Helptags

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

set statusline+=%4v
set statusline+=\ %l/%L "cursor line/total lines
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
" map ^T :w!<CR>:!aspell check %<CR>:e! %<CR>

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

let g:fullscreen_colorscheme = "iawriter"
let g:fullscreen_font = "Cousine:h14"
let g:normal_colorscheme = "codeschool"
let g:normal_font="Inconsolata:h14"

" SortWords (see: http://stackoverflow.com/a/1328392/1264925)
function! SortWords()
  " Get the visual mark points
  let StartPosition = getpos("'<")
  let EndPosition = getpos("'>")

  if StartPosition[0] != EndPosition[0]
    echoerr "Range spans multiple buffers"
  elseif StartPosition[1] != EndPosition[1]
    " This is a multiple line range, probably easiest to work line wise

    " This could be made a lot more complicated and sort the whole
    " lot, but that would require thoughts on how many
    " words/characters on each line, so that can be an exercise for
    " the reader!
    for LineNum in range(StartPosition[1], EndPosition[1])
      call setline(LineNum, join(sort(split(getline('.'), ' ')), " "))
    endfor
  else
    " Single line range, sort words
    let CurrentLine = getline(StartPosition[1])

    " Split the line into the prefix, the selected bit and the suffix

    " The start bit
    if StartPosition[2] > 1
      let StartOfLine = CurrentLine[:StartPosition[2]-2]
    else
      let StartOfLine = ""
    endif
    " The end bit
    if EndPosition[2] < len(CurrentLine)
      let EndOfLine = CurrentLine[EndPosition[2]:]
    else
      let EndOfLine = ""
    endif
    " The middle bit
    let BitToSort = CurrentLine[StartPosition[2]-1:EndPosition[2]-1]

    " Move spaces at the start of the section to variable StartOfLine
    while BitToSort[0] == ' '
      let BitToSort = BitToSort[1:]
      let StartOfLine .= ' '
    endwhile
    " Move spaces at the end of the section to variable EndOfLine
    while BitToSort[len(BitToSort)-1] == ' '
      let BitToSort = BitToSort[:len(BitToSort)-2]
      let EndOfLine = ' ' . EndOfLine
    endwhile

    " Sort the middle bit
    let Sorted = join(sort(split(BitToSort, ' ')), ' ')
    " Reform the line
    let NewLine = StartOfLine . Sorted . EndOfLine
    " Write it out
    call setline(StartPosition[1], NewLine)
  endif
endfunction
