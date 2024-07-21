return {
	{ -- Configure formatters
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			stop_after_first = {
				c = { { "clang-format" } },
				["c++"] = { { "clang-format" } },
				javascript = { { "biome" } },
				lua = { { "stylua" } },
				php = { { "pretty-php" } },
				bash = { { "shfmt" } },
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
