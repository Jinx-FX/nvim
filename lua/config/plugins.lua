local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("config.plugins.toggleterm"),
	require("config.plugins.cmp"),
	require("config.plugins.lsp").config,
	require("config.plugins.dap"),
	require("config.plugins.telescope").config,
	require("config.plugins.editor"),
	require("config.plugins.markdown"),
	require("config.plugins.go"),
	require("config.plugins.yank"),
	require("config.plugins.multi-cursor"),
	require("config.plugins.fzf"),
	require("config.plugins.filetree"),
	require("config.plugins.colorscheme"),
	require("config.plugins.scrollbar"),
	require("config.plugins.treesitter"),
	require("config.plugins.git"),
	require("config.plugins.search"),
	require("config.plugins.indent"),
	require("config.plugins.statusline"),
	require("config.plugins.tabline"),
	require("config.plugins.wilder"),
	require("config.plugins.dropbar"),
	require("config.plugins.move-motion"),
	require("config.plugins.surround"),
	require("config.plugins.comment"),
})

require("custom.compile_run")
