return {
	{ -- Hex code & pattern highlights
		"echasnovski/mini.hipatterns",
		version = false,
		config = function()
			local hipatterns = require("mini.hipatterns")
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
			-- Sleeping car
			footer = "\n      |\\      _,,,---,,_\nZZZzz /,`.-'`'    -.  ;-;;,_\n     |,4-  ) )-,_. ,\\ (  `'-'\n    '---''(_/--'  `-'\\_)",

			-- Default values excluding '_'; Used to open mini.files.
			query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789-.",
		},
	},
	{
		"echasnovski/mini.tabline",
		version = false,
		opts = { tabpage_section = "right", show_icons = false },
		event = "VeryLazy",
	},
	{
		"echasnovski/mini.statusline",
		version = false,
		opts = {
			use_icons = false,
			set_vim_settings = false,
			content = {
				active = function()
					local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 512 })
					local git = MiniStatusline.section_git({ trunc_width = 75, icon = "" })
					local diff = MiniStatusline.section_diff({ trunc_width = 75, icon = "" })
					local diagnostics = MiniStatusline.section_diagnostics({
						trunc_width = 75,
						icon = "",
						signs = { ERROR = "!", WARN = "?", INFO = "@", HINT = "*" },
					})

					local pathname = vim.bo.buftype == "terminal" and "%t"
						or "%#MiniStatuslineFilename#" .. vim.fn.expand("%:t") .. (vim.bo.modified and " [+]" or "")

					local devinfo
					if git == "" then
						devinfo = diff == " -" and "" or diff
					else
						devinfo = git .. (diff == " -" and " " or (" │" .. diff))
					end

					return MiniStatusline.combine_groups({
						{ hl = mode_hl, strings = { mode } },
						{ hl = "MiniStatuslineDevinfo", strings = { diagnostics } },
						"%<", -- Mark general truncate point
						{ hl = "MiniStatuslineFilename", strings = { pathname } },
						"%=", -- End left alignment
						{ hl = "MiniStatuslineDevinfo", strings = { devinfo } },
						{ hl = mode_hl, strings = { "%-2l,%-2v" } },
					})
				end,
			},
		},
	},
}
