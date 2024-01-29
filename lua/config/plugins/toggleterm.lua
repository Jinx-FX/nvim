return {
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		opts = { --[[ things you want to change go here]] },
		keys = function()
			local float_opts = {
				border = "rounded",
			}
			local lazygit = require("toggleterm.terminal").Terminal:new {
				cmd = "lazygit",
				hidden = true,
				direction = "float",
				float_opts = float_opts,
			}
			local yazi = require("toggleterm.terminal").Terminal:new {
				cmd = "yazi",
				hidden = true,
				direction = "float",
				float_opts = float_opts,
			}

			return {
				{
					"<leader>gl",
					function()
						lazygit:toggle()
					end,
					desc = "LazyGit",
				},
				{
					"<leader>gy",
					function()
						yazi:toggle()
					end,
					desc = "File Navigator",
				}
			}
		end
	}
}
