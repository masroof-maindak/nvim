-- Spellcheck + Wrap + Linebreak for Markdown files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
	end,
})

-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
	callback = function(event)
		print('LSP attached to buffer ' .. event.buf)
		local opts = { buffer = event.buf }
		vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
		vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
		vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
		vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
		vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
		vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
		vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
		vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
		vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
		vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
	end,
})

-- C/C++ LSP
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp" },
	callback = function()
		local lspconfig = require('lspconfig')
		lspconfig.clangd.setup {
			on_attach = _G.lsp_on_attach,
		}
	end,
})

-- Go LSP
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "go" },
	callback = function()
		local lspconfig = require('lspconfig')
		lspconfig.gopls.setup {
			on_attach = _G.lsp_on_attach,
		}
	end,
})
