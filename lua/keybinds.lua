local map = vim.keymap.set

-- Basic
map("i", "jk", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })
map("n", "<C-s>", ":w<CR>", { noremap = true, silent = true, desc = ":w" })
map("n", "<C-q>", ":qa<CR>", { noremap = true, silent = true, desc = ":qa" })
map("n", "<leader>q", ":q<CR>", { noremap = true, silent = true, desc = ":q" })
map("n", "<leader>w", ":w<CR>", { noremap = true, silent = true, desc = ":w" })

-- Misc
map("v", "<", "<gv", { noremap = true, silent = true })
map("v", ">", ">gv", { noremap = true, silent = true })
map("n", "<Esc>", ":noh<CR><Esc>", { noremap = true, silent = true, desc = "Remove highlights" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit insert mode in terminal" })

-- Buffer Management
map("n", "<leader>bd", ":bd<CR>", { noremap = true, desc = "Delete buffer" })
map("n", "<Tab>", ":bn<CR>", { noremap = true, silent = true })
map("n", "<S-Tab>", ":bp<CR>", { noremap = true, silent = true })

-- Mini.files
local function open_mini_files(arg)
	if not MiniFiles.close() then
		MiniFiles.open(arg)
	end
end

map("n", "-", function()
	open_mini_files(vim.api.nvim_buf_get_name(0))
end, { desc = "Open MiniFiles in current file's directory" })

map("n", "_", function()
	open_mini_files(vim.uv.cwd())
end, { desc = "Open MiniFiles in launch directory" })

-- Mini.pick
map("n", "<leader>pf", "<CMD>Pick files<CR>", { noremap = true, desc = "Select file" })
map("n", "<leader>pb", "<CMD>Pick buffers<CR>", { noremap = true, desc = "Select buffer" })
map("n", "<leader>ph", "<CMD>Pick help<CR>", { noremap = true, desc = "Select buffer" })
map("n", "<leader>gs", "<CMD>Pick grep live<CR>", { noremap = true, desc = "Live grep across files" })

-- Version Control
map("n", "go", "<CMD>lua MiniDiff.toggle_overlay()<CR>", { noremap = true, desc = "Toggle diff overlay" })
map({ "n", "x" }, "<Leader>gc", "<CMD>lua MiniGit.show_at_cursor()<CR>", { desc = "Show Git history at cursor" })
map({ "n", "v" }, "<Leader>gh", "<CMD>lua MiniGit.show_range_history()<CR>", { desc = "Git show range history" })
map({ "n", "v" }, "<Leader>gd", "<CMD>lua MiniGit.show_diff_source()<CR>", { desc = "Git show diff source" })

-- Move to the beginning/end of the line
map("n", "L", "$", { noremap = true, silent = true })
map("n", "H", "^", { noremap = true, silent = true })
map("v", "L", "g_", { noremap = true, silent = true })
map("v", "H", "^", { noremap = true, silent = true })

-- Completion
map("i", "<C-f>", [[pumvisible() ? "\<C-y>" : "\<C-f>"]], { expr = true })
map("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
map("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Window resizing
map("n", "<C-left>", "<C-w><", { noremap = true, silent = true })
map("n", "<C-down>", "<C-w>-", { noremap = true, silent = true })
map("n", "<C-up>", "<C-w>+", { noremap = true, silent = true })
map("n", "<C-right>", "<C-w>>", { noremap = true, silent = true })
