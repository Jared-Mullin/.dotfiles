return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
        require('nvim-treesitter.configs').setup({
            -- A list of parser names, or "all"
            ensure_installed = { 'markdown', 'markdown_inline', 'lua', 'go' },
            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,
            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
            auto_install = true,
            indent = {
                enable = true
            },
            highlight = {
                enable = true,
            },
        })
    end
}
