return {
	{
		"shellRaining/hlchunk.nvim",
		init = function()
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, { pattern = "*", command = "EnableHL", })
			require('hlchunk').setup({
				chunk = {
					enable = true,
					use_treesitter = true,
					style = {
						{ fg = "#806d9c" },
					},
				},
				indent = {
					chars = { "│", "¦", "┆", "┊", },
					use_treesitter = false,
					style = {
						"#BFA6B7"
					}
				},
				blank = {
					enable = false,
				},
				line_num = {
					use_treesitter = true,
				},
			})
		end
	}
}
