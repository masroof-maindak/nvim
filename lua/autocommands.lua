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
		local client = vim.lsp.get_client_by_id(event.data.client_id)

		if client ~= nil and client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(true)
		end

		-- LSP keymaps
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })

		vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open diagnostics float" })
		vim.keymap.set("n", "[[", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
		vim.keymap.set("n", "]]", vim.diagnostic.goto_prev, { desc = "Go to prev diagnostic" })

		vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { desc = "Show code actions" })
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Show references" })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
		vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { desc = "Show signature help" })

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
