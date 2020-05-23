set nocompatible              
filetype off                  
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"Plugin 'valloric/youcompleteme'

call vundle#end()            " required
filetype plugin indent on    " required
"||||||||||||| Custom Settings Here ||||||||||||||||
" <------ CUSTOM CURSOR SETTINGS ------>
let &t_SI.="\e[1 q" "SI = INSERT mode
let &t_SR.="\e[1 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

"  1 -> blinking block
"  2 -> solid block 
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

" <----- RELATIVE NUMBER -----> 
" turn hybrid line numbers on
:set number
" :set nu rnu

" turn hybrid line numbers on
:set number relativenumber
:set nu rnu

" Delete without copying
nnoremap <leader>d "_d
xnoremap <leader>d "_d

" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
