return {
	{
		-- automatically highlighting other uses of the word under the cursor
		-- using either LSP, Tree-sitter, or regex matching
		"RRethy/vim-illuminate",
		config = function()
			require('illuminate').configure({
				providers = {
					-- 'lsp',
					-- 'treesitter',
					'regex',
				},
			})
			vim.cmd("hi IlluminatedWordText guibg=#393E4D gui=none")
		end
	},
	{
		-- automated bullet lists
		"dkarter/bullets.vim",
		lazy = false,
		ft = { "markdown", "txt" },
	},
	{
		"NvChad/nvim-colorizer.lua",
		opts = {
			filetypes = { "*" },
			user_default_options = {
				RGB = true,       -- #RGB hex codes
				RRGGBB = true,    -- #RRGGBB hex codes
				names = true,     -- "Name" codes like Blue or blue
				RRGGBBAA = false, -- #RRGGBBAA hex codes
				AARRGGBB = true,  -- 0xAARRGGBB hex codes
				rgb_fn = false,   -- CSS rgb() and rgba() functions
				hsl_fn = false,   -- CSS hsl() and hsla() functions
				css = false,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = false,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
				-- Available modes for `mode`: foreground, background,  virtualtext
				mode = "virtualtext", -- Set the display mode.
				-- Available methods are false / true / "normal" / "lsp" / "both"
				-- True is same as normal
				tailwind = true,
				sass = { enable = false },
				virtualtext = "■",
			},
			-- all the sub-options of filetypes apply to buftypes
			buftypes = {},
		}
	},
	-- use <CR> select block
	{ 'gcmt/wildfire.vim', lazy = false, },
	{
		"fedepujol/move.nvim",
		config = function()
			local opts = { noremap = true, silent = true }
			-- Normal-mode commands
			vim.keymap.set('n', '<c-j>', ':MoveLine(1)<CR>', opts)
			vim.keymap.set('n', '<c-k>', ':MoveLine(-1)<CR>', opts)

			-- Visual-mode commands
			-- vim.keymap.set('v', '<c-K>', ':MoveBlock(1)<CR>', opts)
			-- vim.keymap.set('v', '<c-J>', ':MoveBlock(-1)<CR>', opts)
		end
	},
	{
		-- better replace and exchange text
		"gbprod/substitute.nvim",
		config = function()
			local substitute = require("substitute")
			substitute.setup({
				on_substitute = require("yanky.integration").substitute(),
				highlight_substituted_text = {
					enabled = true,
					timer = 200,
				},
			})
			-- execute <c-s>iw to replace the current word under the cursor with the current yank,
			-- or <c-s>ip to replace the paragraph
			vim.keymap.set("n", "<c-s>", substitute.operator, { noremap = true })
			vim.keymap.set("n", "<c-s>h", function() substitute.operator({ motion = "e" }) end, { noremap = true })
			vim.keymap.set("n", "<c-s>s", substitute.line, { noremap = true })
			vim.keymap.set("n", "<c-s>I", substitute.eol, { noremap = true })
			vim.keymap.set("x", "<c-s>", substitute.visual, { noremap = true })
		end
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end
	},
}
