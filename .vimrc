if exists('$TMUX')
    set term=screen-256color
endif
set term=screen

execute pathogen#infect()
syntax on
filetype plugin indent on

"txtbrowser
au BufRead,BufNewFile *.txt setlocal ft=txt

color monokai

set encoding=utf8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"set background=dark
"color solarized
"set guifont=Monaco\ 12
"set guifont=Monaco:h10
"set guifont=Consolas:h15
"set guifont=Inconsolata:h13
"set guifont=Monospace\ 13
set nu

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

"set directory to the file in current window
"set autochdir
let g:miniBufExplMapCTabSwitchBufs = 1

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

"set grepprg=grep\ -n

"vi compatible
set nocompatible

"set clipboard for windows
set clipboard+=unnamed

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
"set mouse=a
"set selection=exclusive
"set selectmode=mouse,key
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

"ctags 
nmap<silent> <C-F8> :!ctags -R<cr>

"tarbar 
nmap<silent> <F4> :TagbarToggle<cr>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 20
let g:tagbar_left = 1

"quickfix window
map <F6> :cp<cr>
"map <F7> :cn<cr>

"nerd_commenter
map <F9> <leader>c<space>
" map <F10> <leader>cu
let NERDSpaceDelims=1

"switch between h and cpp files
nnoremap <silent> <F12> :A<cr>
imap <silent> <F12> :A<cr>

nnoremap <silent> <F3> :Grep<CR>

"set for bufexplorer
noremap <silent> <F7> :BufExplorer<CR>
noremap <silent> <m-F11> :BufExplorerHorizontalSplit<CR>
noremap <silent> <c-F11> :BufExplorerVerticalSplit<CR>

"set for TagHighlight
nnoremap <silent> <c-F8> :UpdateTypesFile<CR>

"set for syntastic
let g:syntastic_always_populate_loc_list=1

"set for compile
autocmd FileType c,cpp  map <buffer> <F5> :call CompileRunCpp()<cr>
autocmd FileType java   map <buffer> <F5> :call CompileRunJava()<cr>
autocmd FileType python map <buffer> <F5> :call CompileRunPython()<cr>
autocmd FileType dosbatch map <buffer> <F5> :call CompileRunCmd()<cr>
autocmd FileType sh map <buffer> <F5> :call CompileRunSh()<cr>
func! CompileRunCpp()
    exec "wall"
    exec "!g++ -g3 % -o %<"
    exec "!./%<"
endfun
func! CompileRunJava()
    exec "wall"
    exec "!javac %"
    exec "!java %<"
endfun
func! CompileRunPython()
    exec "wall"
    exec "!python %"
endfun
func! CompileRunCmd()
    exec "wall"
    exec "!cmd /c %"
endfun
func! CompileRunSh()
    exec "wall"
    exec "!bash %"
endfun

autocmd FileType c,cpp map <buffer> <C-F7> :call CompileCpp()<cr>
autocmd FileType java  map <buffer> <C-F7> :call CompileJava()<cr>
func! CompileCpp()
    exec "wall"
    exec "!g++ -g3 -c %"
endfun
func! CompileJava()
    exec "wall"
    exec "!javac %"
endfun


"set for neocompl
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr>`  "\<C-n>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
inoremap <expr><Enter>  pumvisible() ? "\<C-Y>" : "\<Enter>" 
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"
"

" For cursor moving in insert mode(Not recommended)
inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

""""CtrlP configure
let g:ctrlp_by_filename = 1

"powerline {
set laststatus=2 
set t_Co=256 
let g:Powerline_symbols='fancy' 
let Powerline_symbols = 'compatible' 
"}
"
nmap <F8> :UpdateTypesFile<cr>


"Better Rainbow Parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"让vim记忆上次编辑的位置
autocmd BufReadPost *
			\ if line("'\"")>0&&line("'\"")<=line("$") |
			\	exe "normal g'\"" |
			\ endif
"让vim记忆上次编辑的位置
"

" do not ignore case
set noic

let g:vim_markdown_frontmatter=1

set cc=120
let g:pymode_virtualenv=0

" for mac copy and paste
vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("pbpaste"))<CR>p

let g:simple_todo_map_keys = 0
nmap <c-i> <Plug>(simple-todo-new)
" nmap <c-o> <Plug>(simple-todo-below)
nmap <c-x> <Plug>(simple-todo-mark-as-done)
nmap <c-u> <Plug>(simple-todo-mark-as-undone)

function! s:isAtStartOfLine(mapping)
    let text_before_cursor = getline('.')[0 : col('.')-1]
    let mapping_pattern = '\V' . escape(a:mapping, '\')
    let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
    return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
            \ <SID>isAtStartOfLine('\|\|') ?
            \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
            \ <SID>isAtStartOfLine('__') ?
            \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" pydocstring
nmap <silent> <c-k> <Plug>(pydocstring)
