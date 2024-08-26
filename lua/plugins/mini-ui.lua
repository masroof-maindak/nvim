return {
	{
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
			footer = "\n      |\\      _,,,---,,_\nZZZzz /,`.-'`'    -.  ;-;;,_\n     |,4-  ) )-,_. ,\\ (  `'-'\n    '---''(_/--'  `-'\\_)",

			-- Default values with exception of '-' as I use it to open mini.files.
			query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789_.",
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
					local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 50 })
					local git = MiniStatusline.section_git({ trunc_width = 75, icon = "" })
					local diff = MiniStatusline.section_diff({ trunc_width = 75, icon = "" })
					local diagnostics = MiniStatusline.section_diagnostics({
						trunc_width = 75,
						icon = "",
						signs = { ERROR = "!", WARN = "?", INFO = "@", HINT = "*" },
					})
					local pathname = vim.bo.buftype == "terminal" and "%t"
						or "%#MiniStatuslineFilename#" .. vim.fn.expand("%:t") .. (vim.bo.modified and " [+]" or "")

					local devinfo = ""
					if git ~= "" and diff ~= " -" then
						devinfo = git .. " │" .. diff
					elseif git ~= "" then
						devinfo = git .. " "
					elseif diff ~= " -" then
						devinfo = diff
					end

					return MiniStatusline.combine_groups({
						{ hl = mode_hl, strings = { mode:upper() } },
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
	{
		"echasnovski/mini.indentscope",
		version = false,
		opts = {
			symbol = "┊",
			draw = {
				animation = function()
					return 0
				end,
			},
			mappings = {
				-- Select in visual mode
				object_scope = "is",
				object_scope_with_border = "as",

				-- Move to scope border
				goto_top = "[i",
				goto_bottom = "]i",
			},
		},
	},
}
