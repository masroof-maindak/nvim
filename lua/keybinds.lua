local key = vim.keymap.set

-- Exit insert mode w/ 'jk'
key("i", "jk", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })

-- Save with 'Ctrl-s'
key("n", "<C-s>", ":w<CR>", { noremap = true, silent = true, desc = ":w" })

-- Quit/Quit All
key("n", "<C-q>", ":qa<CR>", { noremap = true, silent = true, desc = ":qa" })
key("n", "<leader>q", ":q<CR>", { noremap = true, silent = true, desc = ":q" })

-- Write easily
key("n", "<leader>w", ":w<CR>", { noremap = true, silent = true, desc = ":w" })

-- File opener with '-'
key("n", "-", function()
	MiniFiles.open(vim.api.nvim_buf_get_name(0))
end, { desc = "Open file picker" })

-- Delete current buffer
key("n", "<leader>bd", "<CMD>bd<CR>", { noremap = true, desc = "Delete buffer" })

-- Mini.pick
key("n", "<leader>pf", "<CMD>Pick files<CR>", { noremap = true, desc = "Select file" })
key("n", "<leader>pb", "<CMD>Pick buffers<CR>", { noremap = true, desc = "Select buffer" })
key("n", "<leader>gs", "<CMD>Pick grep live<CR>", { noremap = true, desc = "Live grep across files" })

-- Move to the beginning/end of the line
key("n", "L", "$", { noremap = true, silent = true })
key("n", "H", "^", { noremap = true, silent = true })
key("v", "L", "g_", { noremap = true, silent = true })
key("v", "H", "^", { noremap = true, silent = true })

-- 'Tab' cycles through completion items
key("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
key("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

-- Approve completion item
key("i", "<C-f>", [[pumvisible() ? "\<C-y>" : "\<C-f>"]], { expr = true })

-- Window navigation with 'Ctrl-hjkl'
key("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
key("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
key("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
key("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Window resize with 'Ctrl-arrow'
key("n", "<C-left>", "<C-w><", { noremap = true, silent = true })
key("n", "<C-down>", "<C-w>-", { noremap = true, silent = true })
key("n", "<C-up>", "<C-w>+", { noremap = true, silent = true })
key("n", "<C-right>", "<C-w>>", { noremap = true, silent = true })

-- Cycle to the next buffer with 'Tab'
key("n", "<Tab>", ":bn<CR>", { noremap = true, silent = true })
key("n", "<S-Tab>", ":bp<CR>", { noremap = true, silent = true })

-- Clear search highlights with 'Esc'
key("n", "<Esc>", ":noh<CR><Esc>", { noremap = true, silent = true })

-- Remain in visual selection after shifting text
key("v", "<", "<gv", { noremap = true, silent = true })
key("v", ">", ">gv", { noremap = true, silent = true })

-- Exit terminal insert mode with double Esc
key("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit insert mode in terminal" })
