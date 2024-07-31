-- Spellcheck + Wrap + Linebreak for Markdown/Gitcommit files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "gitcommit" },
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
	end,
})

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
	callback = function(event)
		local opts = { buffer = event.buf }

		-- Set keymaps
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_next()
		end, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_prev()
		end, opts)
		vim.keymap.set("n", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)

		-- Enable completion with mini.completion
		vim.bo[event.buf].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"
	end,
})

-- Disable Linenumbers in Terminals
vim.api.nvim_create_autocmd("TermEnter", {
	callback = function()
		vim.o.number = false
		vim.o.relativenumber = false
	end,
})

-- Disable indentscope in certain files
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"aerial",
		"dashboard",
		"man",
		"help",
		"lazy",
		"leetcode.nvim",
		"mason",
		"neo-tree",
		"NvimTree",
		"neogitstatus",
		"notify",
		"startify",
		"toggleterm",
		"Trouble",
		"trouble",
	},
	callback = function()
		vim.b.miniindentscope_disable = true
	end,
})

-- Disable Indentscope in mini.starter
vim.api.nvim_create_autocmd("User", {
	pattern = "MiniStarterOpened",
	callback = function()
		vim.b.miniindentscope_disable = true
	end,
})
