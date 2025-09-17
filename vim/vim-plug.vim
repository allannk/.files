"vim-plug - easy plugin manager for vim

call plug#begin('$XDG_CONFIG_HOME/vim/plugged')

Plug 'dracula/vim'              " Dracula Color Theme
Plug 'scrooloose/nerdtree'      " File tree

" Plug 'dracula/vim', { 'as': 'dracula' } " Dracula Color Theme
" Plug 'scrooloose/nerdtree'              " File Tree
" Plug 'majutsushi/tagbar'                " Jump to functions in current file
" Plug 'ctrlpvim/ctrlp.vim'               " CTRL+P functionality from Sublime Text
" Plug 'townk/vim-autoclose'              " Automatically close [], (), {} and quotes
" Plug 'vim-airline/vim-airline'          " Status bar and tab management
" Plug 'terryma/vim-smooth-scroll'        " Smooth scrolling with C-u C-d C-b & C-F
" Plug 'vim-airline/vim-airline-themes'
"Plug 'junegunn/goyo.vim'                " Distraction-free mode
"Plug 'vim-scripts/DrawIt'               " Interactive box drawing
"Plug 'rhysd/vim-clang-format' 
"Plug 'kergoth/vim-bitbake'
call plug#end()




" Advanced C++ highlight
" Plug 'octol/vim-cpp-enhanced-highlight'

" Make sure you use single quotes
" Plug 'junegunn/seoul256.vim'
" Plug 'junegunn/vim-easy-align'

" Group dependencies, vim-snippets depends on ultisnips
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using git URL
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

