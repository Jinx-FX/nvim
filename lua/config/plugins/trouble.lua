return {
    "folke/trouble.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts =  {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            signs = {
                -- icons / text used for a diagnostic
                error = "🤕",
                -- error = "🥵",
                -- warning = "😢",
                warning = "😦",
                hint = "😐",
                information = "🤔",
                other = "🤨",
            },
        }
}
