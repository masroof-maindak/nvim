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

		-- LSP keymaps
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, { desc = "Go to definition" })
		vim.keymap.set("n", "gD", function()
			vim.lsp.buf.declaration()
		end, { desc = "Go to declaration" })
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, { desc = "Show hover information" })
		vim.keymap.set("n", "<leader>d", function()
			vim.diagnostic.open_float()
		end, { desc = "Open diagnostics float" })
		vim.keymap.set("n", "[[", function()
			vim.diagnostic.goto_next()
		end, { desc = "Go to next diagnostic" })
		vim.keymap.set("n", "]]", function()
			vim.diagnostic.goto_prev()
		end, { desc = "Go to previous diagnostic" })
		vim.keymap.set("n", "<leader>a", function()
			vim.lsp.buf.code_action()
		end, { desc = "Show code actions" })
		vim.keymap.set("n", "<leader>gr", function()
			vim.lsp.buf.references()
		end, { desc = "Show references" })
		vim.keymap.set("n", "<leader>rn", function()
			vim.lsp.buf.rename()
		end, { desc = "Rename symbol" })
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, { desc = "Show signature help" })

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
