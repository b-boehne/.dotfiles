" to be able to use :Man for manpages
"runtime! ftplugin/man.vim

"this wraps git commit messages, fuck that
"" filetype plugin indent on
syntax enable

set tabstop=2
set backspace=indent,eol,start
set number
set relativenumber

"------------------Mappings------------------"
"Make it easy to edit the Vimrc file."
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Add simple highlight removal - Leader, Leertaste"
nmap <Leader><space> :nohlsearch<cr>

"Einfaches Modus switchen - kj"
imap kj <Esc>

"Cursor Mode Change bei verschiedenen Modi"
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[3 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

"------------------Auto-Commands-------------"
"Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

" paste buffer is normal buffer on linux -- DISABLED for Mac OS "
" set clipboard=unnamedplus
set clipboard=unnamed

" highlight search results "
set hlsearch

" searching starts immediately when typing "
set incsearch

" ignores case by default in search "
set ignorecase

" doesn't ignore case when UPPERCASE letters exist in search "
set smartcase

" keep 5 lines between cursor and edge of screen "
set scrolloff=5

" keep longer history "
set history=1000

" well duh "
"let mapleader = ' '
map <Space> <Leader>

" shorter timeout between compound commands "
set timeoutlen=150

" easy removal of searchhighlighting "
nnoremap ,<Space> :nohlsearch<Cr>

" Put search results in the middle of the screen "
nnoremap n nzz
nnoremap N Nzz

" make sure j and k scroll visual lines "
nmap j gj
nmap k gk

" easy tab switching via H and L "
nmap H gT
nmap L gt

" append ; at the end of the line via <Leader>; "
nnoremap <Leader>; A;<Esc>
inoremap <Leader>; <Esc>A;<Esc>

"delete whole function with dm (only working in php class files - experimental)"
nnoremap dm [mV/^\s}<CR>d:nohlsearch<CR>

"Y to yank until end of line "
map Y y$

" jump to selection begin when yanking, not first yanked char in buffer (DOES NOT WORK) "
"vnoremap y mxy`x

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
