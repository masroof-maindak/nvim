return {
	{ -- Display colours
		"NvChad/nvim-colorizer.lua",
		event = "User FilePost",
		opts = {
			filetypes = {
				"*",
				cmp_docs = { always_update = true },
			},
			user_default_options = {
				names = false,
			},
		},
	},
}
