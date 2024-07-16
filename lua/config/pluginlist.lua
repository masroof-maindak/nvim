-- add('github/copilot.vim')

-- require('mini.ai').setup({})
-- require('mini.basics').setup({
-- 	options = {
-- 		extra_ui = true,
-- 	},
-- })
-- require('mini.bracketed').setup()
-- require('mini.completion').setup()
-- require('mini.diff').setup()
-- require('mini.jump').setup()
-- require('mini.jump2d').setup()
-- require('mini.move').setup()
-- require('mini.trailspace').setup()

return {
	{ -- Colour Scheme
		'echasnovski/mini.base16',
		version = false,
		lazy = false,
		priority = 1000,
	},

	{ -- MINI
		{ -- UTILITY
			{
				'echasnovski/mini.files',
				version = false,
				opts = {
					content = { prefix = function() end },
				},
				event = "VeryLazy"
			},
			{
				'echasnovski/mini.pick',
				version = false,
				opts = {

				},
			},
		},
		{ -- EDITING
			{ 'echasnovski/mini.comment', version = false, opts = {}, event = "VeryLazy" },
			{
				'echasnovski/mini.surround',
				version = false,
				opts = {
					highlight_duration = 1000,
				},
				events = "VeryLazy",
			},
			{ 'echasnovski/mini.pairs',   version = false, opts = {}, event = "VeryLazy" },
		},
		{ -- UI
			{
				'echasnovski/mini.hipatterns',
				version = false,
				opts = {
					highlighters = {
						fixme = { pattern = 'FIXME', group = 'MiniHipatternsFixme' },
						hack  = { pattern = 'HACK', group = 'MiniHipatternsHack' },
						todo  = { pattern = 'TODO', group = 'MiniHipatternsTodo' },
						note  = { pattern = 'NOTE', group = 'MiniHipatternsNote' },
					}
				}
			},
			{ 'echasnovski/mini.starter', version = false, opts = {} },
			{ 'echasnovski/mini.tabline', version = false, opts = {} },
			{
				'echasnovski/mini.statusline',
				version = false,
				opts = {
					use_icons = false,
					set_vim_settings = false,
				},
			},
		},
	},

	{ -- Keybind helper
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {}
	},

	{ -- Display colours
		"NvChad/nvim-colorizer.lua",
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

	{ -- LSP
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		event = VeryLazy,
	},

	{ -- Syntax Highlighting
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		opts = {
			ensure_installed = {
				'lua', 'vimdoc', 'python', 'cpp', 'c', 'go', 'javascript', 'php', 'markdown', 'json', 'yaml',
				'html', 'css', 'dockerfile'
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		},
	},

	{ -- Indentation lines
		'lukas-reineke/indent-blankline.nvim',
		main = 'ibl',
		opts = {
			indent = {
				char = '┊',
				smart_indent_cap = true,
			}
		},
	},
}
