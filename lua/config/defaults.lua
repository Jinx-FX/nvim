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

-- Switch Chinese input method after `esc`
-- Dependence: im-select. Download im-select here: https://github.com/daipeihust/im-select
-- In addition, you need to replace com.apple.keylayout.ABC with the ID of your English input method.
-- You can run the im-select command to view all available input methods and their IDs.
vim.cmd('autocmd InsertLeave * silent !/usr/local/bin/im-select com.apple.keylayout.ABC')
-- File storage, save editing history
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
-- After opening the file, move the cursor to the location where it was last edited
vim.cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])
-- markdown snippets
vim.cmd([[source ~/.config/nvim/ftplugins/markdown.vim]])
-- Enable spell check for md files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.md", command = "setlocal spell", })
-- Change the current directory to the directory where the current file is located
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*", command = "silent! lcd %:p:h", })
-- Every time save the file, spaces at the end of each line are automatically removed
vim.cmd([[autocmd BufWritePre * :%s/\s\+$//e]])
-- Whenever a new terminal buffer is opened, it automatically enters insert mode
vim.cmd([[autocmd TermOpen term://* startinsert]])
