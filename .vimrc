
"" Configuration for Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'Raimondi/delimitMate'   "auto-completion for quotes, parens, brackets, etc.
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-startify'
Plugin 'tmhedberg/SimpylFold'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

let g:gruvbox_contrast_dark='hard'
Plugin 'morhetz/gruvbox'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on
filetype on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

"" END Vundle


"functional
let mapleader=";"
set encoding=utf-8
set clipboard=unnamed

set shortmess=atI
autocmd BufEnter * :syntax sync fromstart

set showcmd         " 显示命令
set lz              " 当运行宏时，在命令执行完成之前，不重绘屏幕
set hid             " 可以在没有保存的情况下切换buffer
set backspace=eol,start,indent
set whichwrap+=<,>,h,l " 退格键和方向键可以换行
set incsearch       " 增量式搜索
set hlsearch        " 高亮搜索
set magic           " 额，自己:h magic吧，一行很难解释
set showmatch       " 显示匹配的括号
set nobackup        " 关闭备份
set nowb
set noswapfile      " 不使用swp文件，注意，错误退出后无法恢复
set lbr             " 在breakat字符处而不是最后一个字符处断行
"set cindent
set wildmenu
set nofen
set fdl=10
set foldlevel=99

"indent
filetype indent on
set autoindent
set copyindent
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4

"appearance
set shortmess=atI
set nu
set ruler
set cursorline
syntax enable
syntax on
set t_Co=256
set background=dark
colorscheme gruvbox
" 相对行号      行号变成相对，可以用 nj  nk   进行跳转 5j   5k 上下跳5行
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! HideNumber()
  if(&relativenumber == &number)
    set relativenumber! number!
  elseif(&number)
    set number!
  else
    set relativenumber!
  endif
  set number?
endfunc


"split
set splitbelow
set splitright

"key map and autocmd
cmap w!! w !sudo tee >/dev/null %
map <C-l> :nohlsearch<CR>
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
nnoremap <space> za
nnoremap > >>
nnoremap < <<
vnoremap < <gv
vnoremap > >gv
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nnoremap <F2> :call HideNumber()<CR>
nmap <silent> <F3> :NERDTreeToggle<CR>
nmap <silent> <F4> :TagbarToggle<CR>
nmap <silent> <F6> :SyntasticCheck<CR>
nmap <silent> <F7> :SyntasticReset<CR>
set pastetoggle=<F8>
if exists("$VIRTUAL_ENV")
    autocmd FileType python map <buffer> <F5> :!$VIRTUAL_ENV'/bin/python' %<CR>
else
    autocmd FileType python map <buffer> <F5> :!python %<CR>
endif
autocmd BufWritePre * :%s/\s\+$//e    "delete trailing tab or space

"" Configuration for tagbar
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }
"" END tagbar


"" Configuration for vim-airline
let g:airline_theme="gruvbox"
let g:airline_powerline_fonts=1
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
"" END vim-airline


"" Configuration for YCM
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings=0
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_autoclose_preview_window_after_completion=1
set completeopt=longest,menu,preview
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" change key map (VimTip1228)
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
" END YCM


"" Configuration for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = "✘"
let g:syntastic_warning_symbol = "△"
"" END syntastic


"" Configuration for Python
let python_highlight_all=1
" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

"" END Python


"" Configuration for ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(log|jpg|exe|so|dll)$',
  \ }

"" END ctrlp

"" Configuration for SimpylFold
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_import = 0
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
"" END SimpylFold


"" Configuration for NerdCommenter
let g:NERDSpaceDelims=1
"" End NerdCommenter


"" Configuration for ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"" END ultisnips
