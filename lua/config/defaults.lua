vim.o.termguicolors = true
vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
vim.o.ttyfast = true
vim.o.autochdir = true
vim.o.exrc = true
vim.o.secure = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.expandtab = false
vim.o.tabstop = 2
vim.o.smarttab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.autoindent = true
vim.o.list = true
vim.o.listchars = 'tab:|\\ ,trail:▫'
vim.o.scrolloff = 4
vim.o.ttimeoutlen = 0
vim.o.timeout = false
vim.o.viewoptions = 'cursor,folds,slash,unix'
vim.o.wrap = true
vim.o.textwidth = 0
vim.o.indentexpr = ''
vim.o.foldmethod = 'indent'
vim.o.foldlevel = 99
vim.o.foldenable = true
vim.o.foldlevelstart = 99
vim.o.formatoptions = vim.o.formatoptions:gsub('tc', '')
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.showmode = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.inccommand = 'split'
vim.o.completeopt = 'menu,menuone,noinsert,noselect,preview'
vim.o.visualbell = true
vim.o.colorcolumn = '100'
vim.o.updatetime = 100
vim.o.virtualedit = 'block'

-- esc 后中文输入法切换
-- 请注意，你需要先安装 im-select 工具，并确保它在你的 PATH 中。你可以在这里下载 im-select：https://github.com/daipeihust/im-select
-- 此外，你需要将 com.apple.keylayout.US 替换为你的英文输入法的 ID。你可以运行 im-select 命令来查看所有可用的输入法和它们的 ID。
vim.cmd('autocmd InsertLeave * silent !/usr/local/bin/im-select com.apple.keylayout.ABC')

-- 文件缓存, 保存编辑历史
vim.cmd([[
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
"silent !mkdir -p $HOME/.config/nvim/tmp/sessions
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif
]])

-- 在打开文件后将光标移动到上次编辑的位置
vim.cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])

-- markdown snippets
vim.cmd([[source ~/.config/nvim/ftplugins/markdown.vim]])
-- md 文件开启拼写检查
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.md", command = "setlocal spell", })
-- 将当前目录更改为当前文件所在的目录。
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*", command = "silent! lcd %:p:h", })

