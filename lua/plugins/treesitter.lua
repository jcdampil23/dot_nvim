return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
        'windwp/nvim-ts-autotag',
    },
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("nvim-treesitter.configs").setup {
            autotag = {
                enable = true,
            },
            ensure_installed = { 'javascript', 'typescript', 'lua', 'vim', 'vimdoc', 'query' },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                use_languagetree = true,
                additional_vim_regex_highlighting = false,
            },
        }
    end
}
