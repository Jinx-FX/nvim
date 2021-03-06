" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @july

"-----------------------------------------------------------------

" ===
" === Auto load for first time uses
" ===
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"-----------------------------------------------------------------

" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
noremap ; :

" === useful command
" <Esc> 的多选项: Ctrl + [ ; 修改 caplock 为esc ; Ctrl + c(不推荐)
"normal: Ctrl+o ：回到之前光标所在位置
"normal: Ctrl+i ：回到之后光标所在位置
"normal: Ctrl+c : qa! press<enter> to quit nvim and abandon all you had done
"normal: zz : 让当前行移动到屏幕中央
"normal: u : 撤销
"normal: Ctrl+r: 反撤销
"insert: Ctrl+c : <esc>
"*: 在关键字之间跳转

"-----------------------------------------------------------------

" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim

"-----------------------------------------------------------------

" ===
" === Editor behavior
" ===

" 当从输入模式切换为普通模式时，输入法自动切换为英文输入法
" 当再次切换回去时，保持原来的输入法
let s:fcitx_cmd = executable("fcitx5-remote") ? "fcitx5-remote" : "fcitx-remote"
autocmd InsertLeave * let b:fcitx = system(s:fcitx_cmd) | call system(s:fcitx_cmd.' -c')
autocmd InsertEnter * if exists('b:fcitx') && b:fcitx == 2 | call system(s:fcitx_cmd.' -o') | endif

" yank and paste
" 访问系统剪贴板 neovim need 系统剪贴板工具
" 用包管理器安装一个用于管理系统剪贴板的命令行工具(xsel或xclip)即可!
" 在终端中执行命令:sudo pacman -S xsel
" set clipboard+=unnamedplus "让nvim可以使用系统剪贴板
" copy system clipboard
vnoremap ,y "+y
" paste system clipboard
nnoremap ,p "+p

" vim-numbertoggle - Automatic toggling between 'hybrid' and absolute line numbers
" 相比于默认设置，可以让相对索引只在当前使用窗口保持
" Maintainer:        <https://jeffkreeftmeijer.com>
" 来自于 Plug 'jeffkreeftmeijer/vim-numbertoggle' "
" 由于太小了，这里直接复制了
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

set nocompatible " 让 vim 抛弃以前的不常用功能
" 提高 vim 的兼容性
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

syntax on " 自动语法高亮
" Enable cursor line position tracking:
set cursorline
" Remove the underline from enabling cursorline:
highlight clear CursorLine
" Set line numbering to red background:
highlight CursorLineNR ctermbg=red

set mouse=a " 可使用鼠标
set scrolloff=5 " 底部永远预留 5 行
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set hlsearch " 搜索时高亮显示被找到的文本
set incsearch " 搜索时一边输入，一边高亮
set wildmenu "命令补全

set autochdir " 让nvim在当前文件的文件目录执行相关命令

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

" 保留文件修改历史 (git 忽略) tmp/ 存放缓存记录
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
"silent !mkdir -p $HOME/.config/nvim/tmp/sessions
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif

set number " 显示行号
set relativenumber " 相对行号

set expandtab
set tabstop=4 " 设置Tab长度为4空格
set shiftwidth=4 " 设置自动缩进长度为4空格
set softtabstop=4
set autoindent " 继承前一行的缩进方式，适用于多行注释

" 显示空格
set list
set listchars=tab:\|\ ,trail:▫

" 设置编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

set showmatch " 显示括号匹配

" TextEdit might fail if hidden is not set.
set hidden

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Recently vim can merge signcolumn and number column into one
" 如果=number则为上述效果，即各种效果(如git，number)在同一列，不是很喜欢
set signcolumn=yes

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
" Create a new tab with tn : tabnew
noremap tn :tabe<CR>
noremap tm :tab split<CR>
" Move around tabs with th:tab-left and tl:tab-right
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>
" Move the tabs with tsh:tabmove-left and tsl:tabmove-right
noremap tsh :-tabmove<CR>
noremap tsl :+tabmove<CR>

"-----------------------------------------------------------------

" ===
" === Other useful stuff
" ===

" === term
" === Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res -5<CR>:term<CR>

" === Terminal Behaviors
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert " 打开终端默认输入
tnoremap <C-N> <C-\><C-N> "退出终端输入模式
" <C-O> 接在上语句之后本会返回当前文件，这里改为了直接退出终端
" 在普通模式输入<C-O>会返回当前文件
tnoremap <C-O> <C-\><C-N>:q<CR> "退出终端

" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>

" find and replace (需要'g')
noremap \s :%s//g<left><left>

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Call figlet(这是一个软件) 写出大字图
noremap tx :r !figlet 

" press M to show hlgroup
" 提示相关信息
function! SynGroup()
	let l:s = synID(line('.'), col('.'), 1)
	echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
map M :call SynGroup()<CR>

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
		:term ~/.conda/envs/ar/bin/python %
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
Plug 'theniceboy/nvim-deus' "主题配色"
Plug 'ryanoasis/vim-devicons' " 文件图标
Plug 'mg979/vim-xtabline' "精致的顶栏
Plug 'luochen1990/rainbow' "彩色括号"
Plug 'hardcoreplayers/spaceline.vim' "状态栏"

" 界面信息
Plug 'hardcoreplayers/dashboard-nvim' "开始菜单"
Plug 'liuchengxu/vista.vim' "函数和变量信息"
Plug 'preservim/nerdtree' "文件树
Plug 'mbbill/undotree' "文件修改历史

" Editor Enhancement
Plug 'Yggdroot/indentLine' "缩进增强显示
Plug 'preservim/nerdcommenter' " 注释
Plug 'jiangmiao/auto-pairs' "括号等成对出现或删除
Plug 'godlygeek/tabular' " ga, or :Tabularize <regex> to align 。用于对齐

" For general writing
Plug 'junegunn/goyo.vim'

" Markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'} " 预览
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] } " 表格
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] } " 生成目录
Plug 'dkarter/bullets.vim' "自动列表序号递增"

" Git
Plug 'airblade/vim-gitgutter' "行内状态"
Plug 'Xuyuanp/nerdtree-git-plugin' "git在文件树中显示"

" File navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' "模糊文件和文件内容等查找"
Plug 'kevinhwang91/rnvimr' "让nvim可以操作ranger"

" 其他
Plug 'voldikss/vim-floaterm' "浮动终端"

call plug#end()

"-----------------------------------------------------------------

" ===
" === coc.nvim
" === need nodejs,npm install neovim yarn
" lsp : language support protocol [语言支持协议]
let g:coc_global_extensions = [
            \ 'coc-vimlsp',
            \ 'coc-clangd',
            \ 'coc-actions',
            \ 'coc-pyright',
            \ 'coc-tsserver',
            \ 'coc-json',
            \ 'coc-html',
            \ 'coc-sh',
            \ 'coc-translator']

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
nmap <silent> gd <Plug>(coc-definition) "转到定义
nmap <silent> gy <Plug>(coc-type-definition) "转到类型定义
nmap <silent> gi <Plug>(coc-implementation) "待办事项清单
nmap <silent> gr <Plug>(coc-references) "列出参考列表
nmap <leader>rn <Plug>(coc-rename)  " 变量重命名

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

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
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>a  <Plug>(coc-format-selected)
nmap <leader>a  <Plug>(coc-format-selected)

" coc-translator
nmap ts <Plug>(coc-translator-p)
vmap ts <Plug>(coc-translator-pv)

"-----------------------------------------------------------------

" ===
" === rnvimr
" ===
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_bw_enable = 1
let g:rnvimr_border_attr = {'fg': 14, 'bg': -1}
highlight link RnvimrNormal CursorLine
nnoremap <silent> R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }
let g:rnvimr_layout = {
            \ 'relative': 'editor',
            \ 'width': float2nr(round(0.7 * &columns)),
            \ 'height': float2nr(round(0.7 * &lines)),
            \ 'col': float2nr(round(0.15 * &columns)),
            \ 'row': float2nr(round(0.15 * &lines)),
            \ 'style': 'minimal'
            \ }
let g:rnvimr_presets = [{'width': 0.800, 'height': 0.800}]

"-----------------------------------------------------------------

" ===
" === FZF
" ===
" 查找文件
noremap <silent> <C-e> :Files<CR>
"查找工作区文件内容"
noremap <silent> ff :Rg<CR>
"文件历史记录"
noremap <silent> <C-h> :History<CR>
" 查找当前文件函数和变量等
noremap tt :BTags<CR>
" 查找当前文件行内内容
noremap <silent> <C-l> :Lines<CR>
"切换打开过的文件"
noremap <silent> <C-x> :Buffers<CR>
"vim comment记录"
noremap <leader>; :History:<CR>

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))
" 显示运行过的文件，确认便消除
noremap <c-d> :BD<CR>

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }

"-----------------------------------------------------------------

" ===
" === dashboard
" ===
let g:dashboard_default_executive ='fzf'
" nmap <Leader>ss :<C-u>SessionSave<CR>
" nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
let g:dashboard_custom_header=[
    \'',
    \'    ████▌█████▌█ ████████▐▀██▀    ',
    \'  ▄█████ █████▌ █ ▀██████▌█▄▄▀▄   ',
    \'  ▌███▌█ ▐███▌▌  ▄▄ ▌█▌███▐███ ▀  ',
    \' ▐ ▐██  ▄▄▐▀█   ▐▄█▀▌█▐███▐█      ',
    \'   ███ ▌▄█▌  ▀  ▀██  ▀██████▌     ',
    \'    ▀█▌▀██▀ ▄         ███▐███     ',
    \'     ██▌             ▐███████▌    ',
    \'     ███     ▀█▀     ▐██▐███▀▌    ',
    \'     ▌█▌█▄         ▄▄████▀ ▀      ',
    \'       █▀██▄▄▄ ▄▄▀▀▒█▀█           ',
    \'',
    \]

"-----------------------------------------------------------------

" ===
" === goyo
" ===
map <LEADER>gy :Goyo<CR>
map <LEADER>gq :Goyo!<CR>

"-----------------------------------------------------------------

" ===
" === rainbow
" ===
let g:rainbow_active = 1

"-----------------------------------------------------------------

" ===
" === Vista.vim
" ===
noremap <LEADER>v :Vista!!<CR>
noremap F :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc' "可选的还有ctags"
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

" function! NearestMethodOrFunction() abort
    " return get(b:, 'vista_nearest_method_or_function', '')
" endfunction
" set statusline+=%{NearestMethodOrFunction()}
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:scrollstatus_size = 15

"-----------------------------------------------------------------

" ===
" === nerdcommenter
" ===
" <leader>cc comment
" <leader>cu uncomment

" Create default mappings
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

"-----------------------------------------------------------------

" ===
" === xtabline
" ===
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1
noremap \p :echo expand('%:p')<CR> "显示当前位置

"-----------------------------------------------------------------
" ===
" === spaceline.vim
" ===
let g:spaceline_colorscheme = 'space'

"-----------------------------------------------------------------
" ===
" === Dress my nvim
" === deus
set t_Co=256

set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let &t_ut = ''
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark    " Setting dark mode
colorscheme deus

hi NonText ctermfg=gray guifg=grey10
hi SpecialKey ctermfg=blue guifg=grey70

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
" === Bullets.vim
" ===
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'scratch'
			\]

"-----------------------------------------------------------------

" ===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>  " 启用与关闭,启用表格会有相应反应

"-----------------------------------------------------------------

" ===
" === tabular
" ===
vmap ga :Tabularize /

"-----------------------------------------------------------------

" ===
" === nerdtree
" === 几个功能都差不多，不过 *Toggle 使用最好，可以控制开启和关闭
" nnoremap tt :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
let NERDTreeWinSize = 25
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR> " 返回当前文件路径

"-----------------------------------------------------------------

" ===
" === vim-devicons
" ===
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
" let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
let g:NERDTreeGitStatusUseNerdFonts = 1
" let g:NERDTreeGitStatusShowClean = 1

"-----------------------------------------------------------------

" ===
" === Undotree
" ===
noremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24

"-----------------------------------------------------------------

" ===
" === indentLine
" ===
let g:indentLine_enabled = 0
noremap T :IndentLinesToggle<CR>
let g:indentLine_char = '|'
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#EE82EE'

"-----------------------------------------------------------------

" ===
" === vim-markdown-toc
" ===
" ==使用
"   光标处生成- :GenTocGFM 生成GFM风格的目录
"             - :GenTocRedcarpet 生成Redcarpet风格的目录
"             - :其他，GenTocGitlab, GenTocMarked
"   删除      - :RemoveToc
noremap gt : GenTocMarked<CR>
noremap rt : RemoveToc<CR>

let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'

"-----------------------------------------------------------------

" ==
" == GitGutter
" ==
" let g:gitgutter_signs = 0
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'
" autocmd BufWritePost * GitGutter
nnoremap <LEADER>gf :GitGutterFold<CR> "折叠所有除git代码块以外的行
nnoremap H :GitGutterPreviewHunk<CR> "在当前行显示 Git 代码块
nnoremap <LEADER>g- :GitGutterPrevHunk<CR> "去往上一个git版本
nnoremap <LEADER>g= :GitGutterNextHunk<CR> "去往下一个git版本

"-----------------------------------------------------------------

" ==
" == vim-floaterm
" ==
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
let g:floaterm_keymap_new = '<leader>ft'
let g:floaterm_keymap_kill = '<leader>fk'
" Set floating window border line color to gray, and background to orange
hi FloatermBorder guifg=cyan
autocmd User FloatermOpen        " triggered after opening a new/existed floaterm

"-----------------------------------------------------------------
