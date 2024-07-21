return {
	{ -- EDITING
		{ "echasnovski/mini.comment", version = false, opts = {}, event = "VeryLazy" },
		{
			"echasnovski/mini.surround",
			version = false,
			opts = { highlight_duration = 1000 },
			events = "VeryLazy",
		},
		{ "echasnovski/mini.pairs", version = false, opts = {}, event = "VeryLazy" },
		{
			"echasnovski/mini.jump",
			version = false,
			opts = { delay = { idle_stop = 5000 } },
			event = "VeryLazy",
		},
	},
}
