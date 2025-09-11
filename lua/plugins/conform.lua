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
				asm = { "asmfmt" },
				bash = { "shfmt" },
				c = { "clang-format" },
				["c++"] = { "clang-format" },
				cmake = { "gersemi" },
				css = { "prettier" },
				html = { "prettier" },
				javascript = { "prettier" },
				json = { "prettier" },
				kdl = { "kdlfmt" },
				lua = { "stylua" },
				php = { "pretty-php" },
				python = { "ruff format" },
				rust = { "rustfmt" },
				scss = { "prettier" },
				typescript = { "prettier" },
				typst = { "typstyle" },
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
