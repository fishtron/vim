set nocompatible
behave mswin
colorscheme wombat
set autoindent
let html_wrong_comments = 1
set nowrap
set hidden
set history=1000
set softtabstop=2 
set shiftwidth=2
set tabstop=2
set expandtab
set guifont=Liberation\ Mono\ 9
set bs=2
set nocp
set gp=grep\ -nr
set ignorecase
set smartcase
set title
set scrolloff=3
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp
set ruler
set backspace=indent,eol,start
set hlsearch
set incsearch
set listchars=tab:>-,trail:·,eol:$
set shortmess=atI
set confirm
set viminfo='20,<50,s10,h,%
set guioptions+=c
set nu
syntax enable
filetype on
filetype plugin on
filetype indent on

set pastetoggle=<F2>
nmap <silent> <leader>s :set nolist!<CR>
noremap <C-y> <C-r>
noremap <C-n> :bnext<CR>
noremap <C-p> :bprev<CR>
noremap <C-q> :bn <bar> bw #<CR>
noremap <C-s> :w!<CR>
noremap <C-g> :Gsearch<CR>
noremap <C-f> :FufFile **/<CR>
noremap <C-b> :FufBuffer<CR>
noremap <C-x> :BufOnly<CR>
noremap <C-z> :NERDTreeToggle<CR>
inoremap <C-s> <Esc>:w!<CR>
nnoremap ' `
nnoremap ` '
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

let mapleader = ","
let g:fuzzy_matching_limit=20
let g:NERDTreeChDirMode=2

"inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-y> :call PhpDocSingle()<CR> 
vnoremap <C-y> :call PhpDocRange()<CR> 

"autocmd GUIEnter * simalt ~X
autocmd VimLeave * NERDTreeClose
autocmd VimLeave * mks! ~/last.vim
autocmd BufEnter * set ai
autocmd BufEnter * set si
autocmd VimEnter * cd /home/fishtron/WWW/hiretheworld


set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

