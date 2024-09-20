return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		preset = "modern",
		win = {
			border = "single",
			height = { max = 10 },
			padding = { 1, 1 },
			wo = { winblend = 0 },
		},
		icons = {
			mappings = false,
			rules = false,
			breadcrumb = ">",
			separator = ">",
			ellipsis = "…",
			keys = {
				Up = "^ ",
				Down = "v ",
				Left = "< ",
				Right = "> ",
				C = "^-",
				M = "m-",
				D = "dd",
				S = "s-",
				CR = "cr",
				Esc = "esc ",
				ScrollWheelDown = "v",
				ScrollWheelUp = "^ ",
				NL = "nl",
				BS = "bs",
				Space = "_",
				Tab = ">>",
				F1 = "f1",
				F2 = "f2",
				F3 = "f3",
				F4 = "f4",
				F5 = "f5",
				F6 = "f6",
				F7 = "f7",
				F8 = "f8",
				F9 = "f9",
				F10 = "f10",
				F11 = "f11",
				F12 = "f12",
			},
		},
	},
}
