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
	require("config.plugins.joshuto"),
	-- require("config.plugins.winbar"),
	require("config.plugins.leap"),
	require("config.plugins.surround"),
	require("config.plugins.trouble"),
})
