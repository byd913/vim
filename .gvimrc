"gvim config file

"plugin pathogen Manage your 'runtimepath' with ease
"execute pathogen#infect()
":call pathogen#helptags()
"call pathogen#incubate()()
"syntax on
"syntax enable
"filetype plugin on
"execute pathogen#infect('bundle/{}', '/home/byd/.vim/bundle')
execute pathogen#infect()
syntax on
filetype plugin indent on

set background=dark
color solarized
"color desert
"set guifont=Monaco:h12
set nu

"继承前一行的缩进方式
set autoindent
set cindent
set smartindent
set incsearch
"设置tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"当文件修改时自动读取文件
set autoread

"vi compatible
"set nocompatible

"允许backspace和光标跨越行边界
set backspace=2
set whichwrap+=<,>,h,l

"语法高亮显示匹配括号
set showmatch
set ruler
set cmdheight=2
set wildmenu
"不要备份文件
set nobackup
"不要生成swap文件
setlocal noswapfile
set bufhidden=hide
"可以在buffer的任何地方使用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key
set cursorline

set guioptions-=m
set guioptions-=T

set hlsearch
:nmap <F2> :nohls<cr>

"set for ctrl-s
nmap  :wall<cr>
imap  :wall<cr>

"nerdtree
nmap wm :NERDTree<cr>

"tarbar 
nmap<silent> <F4> :TagbarToggle<cr>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 20
let g:tagbar_left = 1

"nerd_commenter
map <F9> <leader>cc
map <F10> <leader>cu

"switch between h and cpp files
nnoremap <silent> <F12> :A<cr>
imap <silent> <F12> :A<cr>

nnoremap <silent> <F3> :Grep<CR>

"set for bufexplorer
noremap <silent> <F11> :BufExplorer<CR>
noremap <silent> <m-F11> :BufExplorerHorizontalSplit<CR>
noremap <silent> <c-F11> :BufExplorerVerticalSplit<CR>

"set for TagHighlight
nnoremap <silent> <c-F8> :UpdateTypesFile<CR>

"close syntastic
let g:loaded_syntastic_plugin = 1

