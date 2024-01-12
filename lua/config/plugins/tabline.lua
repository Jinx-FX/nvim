return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	opts = {
		options = {
			mode = "tabs", -- "buffers"|"tabs"
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local icon = level:match("error") and " " or " "
				return " " .. icon .. count
			end,
			indicator = {
				style = 'underline',
			},
			show_buffer_close_icons = false,
			show_close_icon = false,
			enforce_regular_tabs = true,
			show_duplicate_prefix = false,
			tab_size = 16,
			padding = 0,
			separator_style = "slant",
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Tree",
					highlight = "Directory",
					separator = true -- use a "true" to enable the default, or set your own character
				}
			}
		}
	}
}
