return {
	{
		"echasnovski/mini.files",
		version = false,
		opts = {
			content = { prefix = function() end },
		}, -- remove icons
		event = "VeryLazy",
	},
	{
		"echasnovski/mini.pick",
		version = false,
		config = function()
			local pick = require("mini.pick")
			local win_config = function()
				local height = math.floor(0.618 * vim.o.lines)
				local width = math.floor(0.618 * vim.o.columns)
				return {
					anchor = "NW",
					height = height,
					width = width,
					row = math.floor(0.5 * (vim.o.lines - height)),
					col = math.floor(0.5 * (vim.o.columns - width)),
					border = "none",
				}
			end
			pick.setup({
				source = {
					show = pick.default_show, -- remove icons
				},
				window = {
					config = win_config, -- center pick
				},
			})
		end,
		event = "VeryLazy",
	},
	{ -- LSP Completion
		"echasnovski/mini.completion",
		version = false,
		opts = {
			lsp_completion = {
				source_func = "omnifunc",
				auto_setup = true,
			},
		},
	},
}
