return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            sort_by = "case_sensitive",
            view = {
              width = 30,
            },
            renderer = {
              group_empty = true,
            },
            filters = {
              dotfiles = true,
            },
        })
        
        vim.keymap.set('n', 'tt', ':NvimTreeToggle<CR>', opt)
        vim.keymap.set('n', 'tf', ':NvimTreeFocus<CR>', opt)

    end
}

