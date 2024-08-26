local key = vim.keymap.set

-- Basic
key("i", "jk", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })
key("n", "<C-s>", ":w<CR>", { noremap = true, silent = true, desc = ":w" })
key("n", "<C-q>", ":qa<CR>", { noremap = true, silent = true, desc = ":qa" })
key("n", "<leader>q", ":q<CR>", { noremap = true, silent = true, desc = ":q" })
key("n", "<leader>w", ":w<CR>", { noremap = true, silent = true, desc = ":w" })

-- Misc
key("v", "<", "<gv", { noremap = true, silent = true })
key("v", ">", ">gv", { noremap = true, silent = true })
key("n", "<Esc>", ":noh<CR><Esc>", { noremap = true, silent = true, desc = "Removed highlights" })
key("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit insert mode in terminal" })

-- Buffer Management
key("n", "<leader>bd", "<CMD>bd<CR>", { noremap = true, desc = "Delete buffer" })
key("n", "<Tab>", ":bn<CR>", { noremap = true, silent = true })
key("n", "<S-Tab>", ":bp<CR>", { noremap = true, silent = true })

-- Mini.files
local function open_mini_files(arg)
	if not MiniFiles.close() then
		MiniFiles.open(arg)
	end
end

key("n", "-", function()
	open_mini_files(vim.api.nvim_buf_get_name(0))
end, { desc = "Open MiniFiles in current file's directory" })

key("n", "_", function()
	open_mini_files(vim.uv.cwd())
end, { desc = "Open MiniFiles in launch directory" })

-- Mini.pick
key("n", "<leader>pf", "<CMD>Pick files<CR>", { noremap = true, desc = "Select file" })
key("n", "<leader>pb", "<CMD>Pick buffers<CR>", { noremap = true, desc = "Select buffer" })
key("n", "<leader>ph", "<CMD>Pick help<CR>", { noremap = true, desc = "Select buffer" })
key("n", "<leader>gs", "<CMD>Pick grep live<CR>", { noremap = true, desc = "Live grep across files" })

-- Version Control
key("n", "go", "<CMD>lua MiniDiff.toggle_overlay()<CR>", { noremap = true, desc = "Toggle diff overlay" })
key({ "n", "x" }, "<Leader>gc", "<CMD>lua MiniGit.show_at_cursor()<CR>", { desc = "Show Git history at cursor" })
key({ "n", "v" }, "<Leader>gh", "<CMD>lua MiniGit.show_range_history()<CR>", { desc = "Git show range history" })
key({ "n", "v" }, "<Leader>gd", "<CMD>lua MiniGit.show_diff_source()<CR>", { desc = "Git show diff source" })

-- Move to the beginning/end of the line
key("n", "L", "$", { noremap = true, silent = true })
key("n", "H", "^", { noremap = true, silent = true })
key("v", "L", "g_", { noremap = true, silent = true })
key("v", "H", "^", { noremap = true, silent = true })

-- Completion
key("i", "<C-f>", [[pumvisible() ? "\<C-y>" : "\<C-f>"]], { expr = true })
key("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
key("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

-- Window navigation
key("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
key("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
key("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
key("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Window resizing
key("n", "<C-left>", "<C-w><", { noremap = true, silent = true })
key("n", "<C-down>", "<C-w>-", { noremap = true, silent = true })
key("n", "<C-up>", "<C-w>+", { noremap = true, silent = true })
key("n", "<C-right>", "<C-w>>", { noremap = true, silent = true })
