return {
	{
		-- Install the Node.js mini-server by running either:
		-- 	[sudo] npm -g install instant-markdown-d or, for the pre-release version:
		-- 	[sudo] npm -g install instant-markdown-d@next
		-- or the following command for the Python mini-server (which also requires pandoc to render markdown):
		-- 	pip install --user smdv
		-- 	use :InstantMarkdownPreview
		"instant-markdown/vim-instant-markdown",
		ft = { "markdown" },
		build = "yarn install",
		config = function()
			vim.g.instant_markdown_autostart = 0
		end,
	},
}
