return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd([[colorscheme tokyonight]])
		end,
	},
	{
		"Jinx-FX/nvim-deus",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme deus]])
		end,
	}
}
