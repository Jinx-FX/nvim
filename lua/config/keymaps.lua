vim.g.mapleader = " "

local mode_nv = { "n", "v" }
local mode_v = { "v" }
local mode_i = { "i" }
local nmappings = {

	-- Useful actions
	{ from = "Q",             to = ":quitall<CR>" },
	{ from = ";",             to = ":",                                                                   mode = mode_nv },
	{ from = "\\s",           to = ":%s//g<left><left>",                                                  mode = mode_nv },
	{ from = "Y",             to = "\"+y",                                                                mode = mode_v },
	{ from = "`",             to = "~",                                                                   mode = mode_nv },
	{ from = "c,.",           to = "c%", },
	{ from = ",.",            to = "%",                                                                   mode = mode_nv },
	{ from = "<c-a>",         to = "<ESC>A",                                                              mode = mode_i },
	{ from = "<leader><CR>",  to = ":nohlsearch<CR>" },
	{ from = ",v",            to = "v%" },

	-- Window & splits
	{ from = "<leader>w",     to = "<C-w>w", },
	{ from = "<leader>k",     to = "<C-w>k", },
	{ from = "<leader>j",     to = "<C-w>j", },
	{ from = "<leader>h",     to = "<C-w>h", },
	{ from = "<leader>l",     to = "<C-w>l", },
	{ from = "qf",            to = "<C-w>o", },
	{ from = "<leader>sk",    to = ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>", },
	{ from = "<leader>sj",    to = ":set splitbelow<CR>:split<CR>", },
	{ from = "<leader>sh",    to = ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>", },
	{ from = "<leader>sl",    to = ":set splitright<CR>:vsplit<CR>", },
	{ from = "<up>",          to = ":res +5<CR>", },
	{ from = "<down>",        to = ":res -5<CR>", },
	{ from = "<left>",        to = ":vertical resize-5<CR>", },
	{ from = "<right>",       to = ":vertical resize+5<CR>", },

	-- Tab management
	{ from = "tn",            to = ":tabe<CR>", },
	{ from = "tN",            to = ":tab split<CR>", },
	{ from = "th",            to = ":-tabnext<CR>", },
	{ from = "tl",            to = ":+tabnext<CR>", },
	{ from = "tmh",           to = ":-tabmove<CR>", },
	{ from = "tml",           to = ":+tabmove<CR>", },

}

for _, mapping in ipairs(nmappings) do
	vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end
