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
Plug 'ggreer/the_silver_searcher'

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
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

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

"Mode Settings
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>l :wincmd l<CR>
nnoremap <Leader>n :NERDTreeFind<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
" enable NERDTree line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

" workaround for wsl <c-v> paste
nnoremap <Leader>v <c-v>

" --------------- Search and Replace Start ----------------
" Press * to search for the term under the cursor or a visual selection and
" " then press a key below to replace all instances of it in the current file.
" r - replace all
" rc - manually pick which onces you would like to replace
nnoremap <Leader>rr :%s///g<Left><Left>
nnoremap <Leader>rf :%s///gc<Left><Left><Left>

" The same as above but instead of acting on the whole file it will be
" " restricted to the previously visually selected range. You can do that by
" " pressing *, visually selecting the range you want it to apply to and then
" " press a key below to replace all instances of it in the current selection.
xnoremap <Leader>rr :s///g<Left><Left>
xnoremap <Leader>rf :s///gc<Left><Left><Left>

nnoremap <Leader>re :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <Leader>re "sy:let @/=@s<CR>cgn

" Clear search highlights.
map <Leader>rc :let @/=''<CR>
" --------------- Search and Replace End ----------------

" GFiles instead of Files in order to ignore node_modules
nnoremap <silent> <C-p> :GFiles<CR>

map <F2> :q <CR>
map <Leader>fo gg=G<C-o><C-o>

let g:auto_save = 1  " enable AutoSave on Vim startup

" compile and run programs
map <Leader>1 :exe "!tmux send -t 2 'main1' Enter" <CR><CR>
map <Leader>2 :exe "!tmux send -t 2 'main2' Enter" <CR><CR>
map <Leader>3 :exe "!tmux send -t 2 'main3' Enter" <CR><CR>

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

map <Leader>ac ggVGy
map <Leader>av ggVGp

" colorschemes
set background=dark 
set t_Co=256
colorscheme gruvbox

" YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" let g:ycm_autoclose_preview_window_after_completion = 1
nmap <silent> <Leader>ff :YcmCompleter GoTo<CR>
nmap <silent> <Leader>gf :YcmCompleter FixIt<CR>
nmap <silent> <Leader>gi :YcmCompleter GoToImplementation<CR>
let g:ycm_auto_hover = 'GetType'
set completeopt-=preview
set splitbelow
nmap <leader>y <plug>(YCMHover)

" Nerdtree Vertical Resize
nmap <Leader>w> :vertical res +10<CR>
nmap <Leader>w< :vertical res -10<CR>

nmap <Leader>ed :edit<CR>

" for Ag file search - use :Ag for search
let g:agprg='ag --column'

" colors
nmap <silent> <Leader>col1 :colorscheme gruvbox<CR>
nmap <silent> <Leader>col2 :color blue<CR>
nmap <silent> <Leader>col3 :color delek<CR>
nmap <silent> <Leader>col4 :color evening<CR>
nmap <silent> <Leader>col5 :color morning<CR>
nmap <silent> <Leader>col6 :color peachpuff<CR>
nmap <silent> <Leader>col7 :color slate<CR>
nmap <silent> <Leader>col8 :color darkblue<CR>
nmap <silent> <Leader>col9 :color desert<CR>
nmap <silent> <Leader>col10 :color industry<CR>
nmap <silent> <Leader>col11 :color murphy<CR>
nmap <silent> <Leader>col12 :color ron<CR>
nmap <silent> <Leader>col13 :color torte<CR>
nmap <silent> <Leader>col14 :color elflord<CR>
nmap <silent> <Leader>col15 :color default<CR>
nmap <silent> <Leader>col16 :color kolehler<CR>
nmap <silent> <Leader>col17 :color pablo<CR>
nmap <silent> <Leader>col18 :color shine<CR>
nmap <silent> <Leader>col19 :color zellner<CR>
