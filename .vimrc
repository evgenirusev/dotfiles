syntax on
let mapleader=" "

set ttimeoutlen=100
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'epmatsw/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

set nocompatible
set expandtab
set tabstop=4 softtabstop=4
set expandtab
set smartindent
set smartcase
set scrolloff=8
set shiftwidth=4
set noswapfile
set clipboard=unnamed
set noshowmatch
" turn hybrid line numbers on
set nu!
set rnu

set cmdheight=2
set updatetime=50
" Delete without copying

nnoremap <leader>d "_d
xnoremap <leader>d "_d
set clipboard=unnamedplus

" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>l :wincmd l<CR>
nnoremap <Leader>gd :GoDef<Enter>
nnoremap <Leader>pt :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>pv :NERDTreeFind<CR>

" function to toggle number mode
function! g:ToggleNuMode()
	if(&number == 1)
		set number
		set relativenumber!
	else
		set relativenumber!
		set number!
	endif
endfunc

" map the above function to F4
nnoremap <f4> :call g:ToggleNuMode()<cr>

let g:coc_disable_startup_warning = 1
map <C-n> :NERDTreeToggle<CR>

"Mode Settings

let &t_SI.="\e[1 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>l :wincmd l<CR>
nnoremap <Leader>gd :GoDef<Enter>
nnoremap <Leader>pt :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>pv :NERDTreeFind<CR>

:nnoremap <Leader>v <c-v>

nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>

nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

nnoremap <silent> <C-p> :FZF -m<CR>