return {
	{
		"echasnovski/mini.files",
		version = false,
		opts = { content = { prefix = function() end } }, -- remove icons
		event = "VeryLazy",
	},
	{ "echasnovski/mini.pick", version = false, opts = {}, event = "VeryLazy" },
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
	{ -- GIT
		{ "echasnovski/mini-git", version = false, main = "mini.git", opts = {}, event = "VeryLazy" },
		{
			"echasnovski/mini.diff",
			version = false,
			opts = {
				view = {
					style = 'sign',
				},
			},
			event = "VeryLazy"
		},
	},
}
