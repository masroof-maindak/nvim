return {
	{ -- UI
		{
			"echasnovski/mini.hipatterns",
			version = false,
			config = function()
				local hipatterns = require('mini.hipatterns')
				hipatterns.setup({
					highlighters = {
						fixme = { pattern = "FIXME", group = "MiniHipatternsFixme" },
						check = { pattern = "CHECK", group = "MiniHipatternsHack" },
						hack = { pattern = "HACK", group = "MiniHipatternsHack" },
						todo = { pattern = "TODO", group = "MiniHipatternsTodo" },
						note = { pattern = "NOTE", group = "MiniHipatternsNote" },
						hex_color = hipatterns.gen_highlighter.hex_color(),
					},
				})
			end,
			event = "VeryLazy",
		},
		{
			"echasnovski/mini.starter",
			version = false,
			opts = {
				footer = "\n      |\\      _,,,---,,_\nZZZzz /,`.-'`'    -.  ;-;;,_\n     |,4-  ) )-,_. ,\\ (  `'-'\n    '---''(_/--'  `-'\\_)",
			},
		},
		{ "echasnovski/mini.tabline", version = false, opts = {}, event = "VeryLazy" },
		{
			"echasnovski/mini.statusline",
			version = false,
			opts = {
				use_icons = false,
				set_vim_settings = false,
			},
		},
	},
}
