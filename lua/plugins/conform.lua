return {
	{ -- Configure formatters
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_format = "fallback", stop_after_first = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				c = { "clang-format" },
				["c++"] = { "clang-format" },
				css = { "prettier" },
				scss = { "prettier" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				php = { "pretty-php" },
				bash = { "shfmt" },
				asm = { "asmfmt" },
				rust = { "rustfmt" },
				python = { "ruff format" },
				kdl = { "kdlfmt" },
			},

			format_on_save = nil,

			formatters = {
				shfmt = {
					prepend_args = { "-i", "2" },
				},
			},
		},
		after = "mason.nvim",
		init = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
}
