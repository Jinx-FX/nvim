-- Define a custom component that includes an emoji based on the current mode
local function mode_emoji()
  local mode = vim.fn.mode()
  local emoji = ""
  if mode == "n" then
    emoji = "🤔"
  elseif mode == "i" then
    emoji = "🥰"
  elseif mode == "v" then
    emoji = "😈"
  elseif mode == "V" then
    emoji = "👿"
  elseif mode == "c" then
		emoji = "🤪"
  elseif mode == "t" then
    emoji = "😑"
  end
  return emoji
end

return {
	"nvim-lualine/lualine.nvim",
	-- You can optionally lazy-load heirline on UiEnter
	-- to make sure all required plugins and colorschemes are loaded before setup
	-- event = "UiEnter",
	config = function()
		require('lualine').setup {
			options = {
				icons_enabled = true,
				theme = 'auto',
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				}
			},
			sections = {
				lualine_a = { 'filename' },
				lualine_b = { 'branch', 'diff', 'diagnostics' },
				lualine_c = { mode_emoji },
				lualine_x = {},
				lualine_y = { 'filesize', 'fileformat', 'filetype' },
				lualine_z = { 'location' }
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { 'filename' },
				lualine_x = { 'location' },
				lualine_y = {},
				lualine_z = {}
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {}
		}
	end
}
