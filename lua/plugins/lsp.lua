local servers = {
	"clangd",
	"gopls",
	"tsserver",
	"bashls",
	"dockerls",
	"intelephense",
	"lua_ls"
}

local on_attach = function(client, bufnr)
	vim.api.nvim_exec_autocmds("LspAttach", { buffer = bufnr })
end

local handlers = {
	-- Generic settings for all servers
	function(server_name)
		require("lspconfig")[server_name].setup {
			on_attach = on_attach,
		}
	end,

	["lua_ls"] = function()
		local lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup {
			settings = {
				Lua = {
					telemetry = { enable = false },
					diagnostics = { globals = { "vim" } },
				},
			},
		}
	end,
}

return {
	{ -- LSP configuration
		{ -- Download & Install
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
		{ -- Set up using hereinafter mentioned
			"williamboman/mason-lspconfig.nvim",
			opts = {
				ensure_installed = servers,
				handlers = handlers,
			},
		},
		-- Start LSP servers (wrapper over vim.lsp.start_client?)
		{ "neovim/nvim-lspconfig", event = "BufReadPre" },
		event = "VeryLazy",
	},
}
