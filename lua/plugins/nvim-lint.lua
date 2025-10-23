return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			c = { "clangtidy" },
			["c++"] = { "clangtidy" },
			fish = { "fish" },
			go = { "golangci-lint" },
			python = { "ruff" },
			rust = { "clippy" },
		}

		vim.keymap.set("n", "<leader>L", function()
			lint.try_lint()
		end, { desc = "Lint file" })
	end,
}
