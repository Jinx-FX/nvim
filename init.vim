" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @july

"-----------------------------------------------------------------

" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
noremap ; :
"normal: Ctrl+o ：回到之前光标所在位置
"normal: Ctrl+i ：回到之后光标所在位置
"normal: Ctrl+c : qa! press<enter> to quit nvim and abandon all you had done
"insert: Ctrl+c : <esc>

"-----------------------------------------------------------------

" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1

source ~/.config/nvim/_machine_specific.vim

"-----------------------------------------------------------------

" ===
" === Editor behavior
" ===

" 设置字体 和 字体大小;与终端一直，无法修改
" set guifont=Source\ Code\ Pro\ 12

" yank and paste
" 访问系统剪贴板 neovim need 系统剪贴板工具
" 用包管理器安装一个用于管理系统剪贴板的命令行工具(xsel或xclip)即可!
" 在终端中执行命令:sudo pacman -S xsel
set clipboard+=unnamedplus "让nvim可以使用系统剪贴板
" copy system clipboard
vnoremap ,y "+y
" paste system clipboard
nnoremap ,p "+p

set nocompatible " 让 vim 抛弃以前的不常用功能
" 提高 vim 的兼容性
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set mouse=a " 可使用
syntax on " 自动语法高亮
set scrolloff=5 " 底部永远预留 5 行
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set hlsearch " 搜索时高亮显示被找到的文本
set wildmenu "命令补全

" 设置在状态行显示的信息
" %F 完整文件路径名
" %m 当前缓冲被修改标记
" %m 当前缓冲只读标记
" %h 帮助缓冲标记
" %w 预览缓冲标记
" %Y 文件类型
" %b ASCII值
" %B 十六进制值
" %l 行数
" %v 列数
" %p 当前行数占总行数的的百分比
" %L 总行数
" %{...} 评估表达式的值，并用值代替
" %{"[fenc=".(&fenc==""?&enc:&fenc).((exists("+bomb") && &bomb)?"+":"")."]"} 显示文件编码
" %{&ff} 显示文件类型
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)

" 让光标回到最后一次关闭文件所在位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set number " 显示行号 "

set expandtab
set tabstop=4 " 设置Tab长度为4空格 "
set shiftwidth=4 " 设置自动缩进长度为4空格 "
set softtabstop=4
set autoindent " 继承前一行的缩进方式，适用于多行注释 "
set cindent " c格式的缩进

" 显示空格
set list
set listchars=tab:\|\ ,trail:▫

" 设置编码 "
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

set showmatch " 显示括号匹配 "

" TextEdit might fail if hidden is not set.
set hidden

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Recently vim can merge signcolumn and number column into one
set signcolumn=number

"-----------------------------------------------------------------

" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
noremap <leader>w <C-w>w "切换窗口
noremap <leader>k <C-w>k
noremap <leader>j <C-w>j
noremap <leader>h <C-w>h
noremap <leader>l <C-w>l
noremap qf <C-w>o " 关闭所有窗口，只留一个

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>

"-----------------------------------------------------------------

" ===
" === Tab management
" ===
" Create a new tab with dn : tabnew
noremap dn :tabe<CR>
noremap dN :tab split<CR>
" Move around tabs with dh:tab-left and dl:tab-right
noremap dh :-tabnext<CR>
noremap dl :+tabnext<CR>
" Move the tabs with dsh:tabmove-left and dsl:tabmove-right
noremap dsh :-tabmove<CR>
noremap dsl :+tabmove<CR>

"-----------------------------------------------------------------

" ===
" === Other useful stuff
" ===

" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
    " 先保存，再运行
	exec "w"
	if &filetype == 'c'
		exec "!gcc % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'cs'
		set splitbelow
		silent! exec "!mcs %"
		:sp
		:res -5
		:term mono %<.exe
	elseif &filetype == 'java'
		set splitbelow
		:sp
		:res -5
		term javac % && time java %<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc

"-----------------------------------------------------------------

" ===" 插件管理 "
" === Install Plugins with Vim-Plug
" ===
call plug#begin('~/.config/nvim/plugged')

" Auto Complete "
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Pretty Dress
Plug 'ajmwagar/vim-deus'

" Editor Enhancement
Plug 'jeffkreeftmeijer/vim-numbertoggle' "相对索引
Plug 'majutsushi/tagbar' " 函数和变量信息
Plug 'vim-airline/vim-airline' "状态栏
Plug 'preservim/nerdtree' "文件树

" Markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }

call plug#end()

"-----------------------------------------------------------------

" ===
" === coc.nvim
" === need nodejs,npm install neovim yarn
" lsp : language support protocol [语言支持协议]
let g:coc_global_extensions = [
            \ 'coc-vimlsp',
            \ 'coc-clangd',
            \ 'coc-python',
            \ 'coc-pyright',
            \ 'coc-actions',
            \ 'coc-tsserver',
            \ 'coc-json',
            \ 'coc-html',
            \ 'coc-sh']

" coc插件， 使用 tab 进行补全 
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 回车选择
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 上下移动查找报错
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" 查看函数信息
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" show documentation in preview window.
nnoremap <silent> M :call <SID>show_documentation()<CR>

" Remap for do codeAction of selected region
" Formatting selected code.
function! Show_documentation()
	call CocActionAsync('highlight')
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Formatting selected code. 不怎么清楚
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"-----------------------------------------------------------------

" ===
" === tagbar
" === 查看函数列表，需要ctags程序
nmap <F8> :TagbarToggle<CR>

"-----------------------------------------------------------------

" ===
" === Dress my nvim
" === vim-deus
set t_Co=256
set termguicolors

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark    " Setting dark mode
colorscheme deus
let g:deus_termcolors=256

"-----------------------------------------------------------------

" ===
" === vim-instant-markdown
" === 需要:[sudo] npm -g install instant-markdown-d 
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
" 取消注释允许脚本运行
" let g:instant_markdown_allow_unsafe_content = 1 
" 使tex公式能够编译
let g:instant_markdown_mathjax = 1
let g:instant_markdown_autoscroll = 1         " 禁用实时响应对应
let g:instant_markdown_browser = "chromium --new-window"

"-----------------------------------------------------------------

" ===
" === Markdown Settings
" ===
" Snippets
source ~/.config/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell

"-----------------------------------------------------------------

" ===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>  " 启用与关闭

"-----------------------------------------------------------------

" ===
" === nerdtree
" === 几个功能都差不多，不过 *Toggle 使用最好，可以控制开启和关闭
" nnoremap tt :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR> " 返回当前文件路径

"-----------------------------------------------------------------
