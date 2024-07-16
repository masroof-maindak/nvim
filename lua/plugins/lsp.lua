return {
    { -- LSP
        {
            "williamboman/mason.nvim",
            opts = {
                ui = {
                    icons = {
                        package_installed = "🗹",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    },
                },
            },
        },
        {
            "williamboman/mason-lspconfig.nvim",
            opts = {
                ensure_installed = {
                    "clangd",
                    "gopls"
                },
            },
        },
        {
            "neovim/nvim-lspconfig",
            config = function()
                local lspconfig = require('lspconfig')

                -- Define a function for common on_attach settings
                local on_attach = function(client, bufnr)
                    vim.api.nvim_exec_autocmds('LspAttach', { buffer = bufnr })
                end

                -- Make the on_attach function available globally
                _G.lsp_on_attach = on_attach

                -- LSP server setup
                lspconfig.clangd.setup {
                    on_attach = _G.lsp_on_attach,
                }

                lspconfig.gopls.setup {
                    on_attach = _G.lsp_on_attach,
                }
            end,
        },
        event = "VeryLazy",
    },
}
