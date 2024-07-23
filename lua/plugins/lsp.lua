local servers = {
	"clangd",
	"gopls",
	"tsserver",
	"bashls",
	"dockerls",
	"phpactor",
}

return {
	{ -- LSP
		{
			"williamboman/mason.nvim",
			opts = {
				ui = {
					icons = {
						package_installed = "🗹",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			},
		},
		{
			"williamboman/mason-lspconfig.nvim",
			opts = {
				ensure_installed = servers,
				automatic_installation = true,
			},
		},
		{
			"neovim/nvim-lspconfig",
			config = function()
				local lspconfig = require("lspconfig")

				local on_attach = function(client, bufnr)
					vim.api.nvim_exec_autocmds("LspAttach", { buffer = bufnr })
				end

				for _, lsp in ipairs(servers) do
					lspconfig[lsp].setup({
						on_attach = on_attach,
					})
				end
			end,
		},
		event = "VeryLazy",
	},
}
