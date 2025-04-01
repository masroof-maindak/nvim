local servers = {
	"clangd",
	"gopls",
	"bashls",
	"lua_ls",
	"rust_analyzer",
	"basedpyright",
}

local on_attach = function(client, bufnr)
	vim.api.nvim_exec_autocmds("LspAttach", {
		buffer = bufnr,
		data = { client_id = client.id },
	})
end

local handlers = {
	-- Generic settings for all servers
	function(server_name)
		require("lspconfig")[server_name].setup({
			on_attach = on_attach,
		})
	end,

	-- Server-specific
	["clangd"] = function()
		local lspconfig = require("lspconfig")
		lspconfig.clangd.setup({
			cmd = {
				"clangd",
				"--background-index",
				"--clang-tidy",
				"--header-insertion=iwyu",
				"--completion-style=detailed",
				"--function-arg-placeholders",
				"--fallback-style=llvm",
			},
			init_options = {
				usePlaceholders = true,
				completeUnimported = true,
				clangdFileStatus = true,
			},
			filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "hpp" },
		})
	end,

	["lua_ls"] = function()
		local lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					telemetry = { enable = false },
					diagnostics = { globals = { "vim", "MiniFiles", "MiniStatusline" } },
				},
			},
		})
	end,

	["basedpyright"] = function()
		local lspconfig = require("lspconfig")
		lspconfig.basedpyright.setup({
			settings = {
				basedpyright = {
					analysis = {
						typeCheckingMode = "basic",
					},
				},
			},
		})
	end,
}

return { -- LSP configuration
	{ -- Download LSPs
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {
			ui = {
				icons = {
					package_installed = "+",
					package_pending = "»",
					package_uninstalled = "×",
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
}
