return {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
        { 'neovim/nvim-lspconfig' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/nvim-cmp' },
        { 'L3MON4D3/LuaSnip' },
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
    },
    config = function()
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(client, bufnr)
            lsp_zero.default_keymaps({ buffer = bufnr })
        end)
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {
                'lua_ls',
                'gopls',
                'yamlls',
            },
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,
                ['lua_ls'] = function()
                    require('lspconfig').lua_ls.setup({
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { 'vim' }
                                }
                            }
                        }
                    })
                end
            },
        })

        -- format on save
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = buffer,
            callback = function()
                vim.lsp.buf.format { async = false }
            end
        })
    end
}
