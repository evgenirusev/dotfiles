syntax on
let mapleader=" "

set ttimeoutlen=100
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'epmatsw/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug '907th/vim-auto-save'
Plug 'preservim/nerdcommenter'
Plug 'ParamagicDev/vim-medic_chalk'
Plug 'ycm-core/YouCompleteMe'

" Automatically clear search highlights after you move your cursor.
Plug 'haya14busa/is.vim'

" modify default behavior for star regarding visual seleciton
Plug 'nelstrom/vim-visual-star-search'

" colorschemes
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='gruvbox'
Plug 'octol/vim-cpp-enhanced-highlight'

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

set incsearch
set hlsearch
set ignorecase
set cmdheight=2
set updatetime=50
set nowrap

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

" map the above function to F1
nnoremap <f1> :call g:ToggleNuMode()<cr>

let g:coc_disable_startup_warning = 1
map <C-n> :NERDTreeToggle<CR>

"Mode Settings

let &t_SI.="\e[5 q" "SI = INSERT mode
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

" Press * to search for the term under the cursor or a visual selection and
" " then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>

" The same as above but instead of acting on the whole file it will be
" " restricted to the previously visually selected range. You can do that by
" " pressing *, visually selecting the range you want it to apply to and then
" " press a key below to replace all instances of it in the current selection.
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>

nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

" GFiles instead of Files in order to ignore node_modules
nnoremap <silent> <C-p> :GFiles<CR>

map <F2> :wq! <CR>
map <F9> gg=G<C-o><C-o>

let g:auto_save = 1  " enable AutoSave on Vim startup

" compile and run programs
map <Leader>2 :exe "!tmux send -t 2 'sandbox' Enter" <CR><CR>
map <Leader>1 :exe "!tmux send -t 2 'res' Enter" <CR><CR>

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

map <Leader>ac ggVGy
map <Leader>av ggVGp

" colorschemes
set background=dark 
set t_Co=256
colorscheme gruvbox

" insert single character in normal mode
nmap <C-i> i_<Esc>r
nmap <C-a> <Right>i_<Esc>r
