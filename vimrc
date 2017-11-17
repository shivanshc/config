set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'Valloric/YouCompleteMe'
Plugin 'Scrooloose/nerdtree'
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on

set expandtab
set tabstop=4
set shiftwidth=4
retab
set number
set hlsearch
set incsearch
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
augroup filetype_python
    autocmd!
    au FileType python set foldmethod=indent
    au FileType python set foldlevel=99
    "au FileType python set nosmartindent
    au FileType python map <buffer> <leader>8 :call Flake8()<CR>
    " Tell Vim which characters to show for expanded TABs,
    " trailing whitespace, and end-of-lines. VERY useful!
    au FileType python set listchars=trail:_
    au FileType python set list

    " Also highlight all tabs and trailing whitespace characters.
    au FileType python highlight ExtraWhitespace ctermbg=darkred guibg=darkred ctermfg=yellow guifg=yellow
    au FileType python match ExtraWhitespace /\s\+$\|\t/
    au BufWritePost,cursorhold * filetype detect
    "au FileType python colo molokai
augroup END
syntax on
set statusline=%F\ %l\:%c
autocmd FileType make setlocal noexpandtab
autocmd vimenter * NERDTree
set guifont=consolas:h14
set encoding=utf-8
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * wincmd l
