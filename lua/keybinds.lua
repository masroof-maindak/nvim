-- Basic
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true, desc = ":w" })
vim.keymap.set("n", "<C-q>", ":qa<CR>", { noremap = true, silent = true, desc = ":qa" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true, silent = true, desc = ":q" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true, desc = ":w" })

-- Misc
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("n", "<Esc>", ":noh<CR><Esc>", { noremap = true, silent = true, desc = "Remove highlights" })
vim.keymap.set(
	"t",
	"<Esc><Esc>",
	"<C-\\><C-n>",
	{ noremap = true, silent = true, desc = "Exit insert mode in terminal" }
)

-- Buffer Management
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { noremap = true, desc = "Delete buffer" })
vim.keymap.set("n", "<Tab>", ":bn<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":bp<CR>", { noremap = true, silent = true })

-- Mini.files
local function open_mini_files(arg)
	if not MiniFiles.close() then
		MiniFiles.open(arg)
	end
end

vim.keymap.set("n", "-", function()
	open_mini_files(vim.api.nvim_buf_get_name(0))
end, { desc = "Open MiniFiles in current file's directory" })

vim.keymap.set("n", "_", function()
	open_mini_files(vim.uv.cwd())
end, { desc = "Open MiniFiles in launch directory" })

-- Mini.pick
vim.keymap.set("n", "<leader>pf", "<CMD>Pick files<CR>", { noremap = true, desc = "Select file" })
vim.keymap.set("n", "<leader>pb", "<CMD>Pick buffers<CR>", { noremap = true, desc = "Select buffer" })
vim.keymap.set("n", "<leader>ph", "<CMD>Pick help<CR>", { noremap = true, desc = "Select buffer" })
vim.keymap.set("n", "<leader>gs", "<CMD>Pick grep live<CR>", { noremap = true, desc = "Live grep across files" })

-- Version Control
vim.keymap.set("n", "go", "<CMD>lua MiniDiff.toggle_overlay()<CR>", { noremap = true, desc = "Toggle diff overlay" })
vim.keymap.set(
	{ "n", "x" },
	"<Leader>gc",
	"<CMD>lua MiniGit.show_at_cursor()<CR>",
	{ desc = "Show Git history at cursor" }
)
vim.keymap.set(
	{ "n", "v" },
	"<Leader>gh",
	"<CMD>lua MiniGit.show_range_history()<CR>",
	{ desc = "Git show range history" }
)
vim.keymap.set({ "n", "v" }, "<Leader>gd", "<CMD>lua MiniGit.show_diff_source()<CR>", { desc = "Git show diff source" })

-- Move to the beginning/end of the line
vim.keymap.set("n", "L", "$", { noremap = true, silent = true })
vim.keymap.set("n", "H", "^", { noremap = true, silent = true })
vim.keymap.set("v", "L", "g_", { noremap = true, silent = true })
vim.keymap.set("v", "H", "^", { noremap = true, silent = true })

-- Completion
vim.keymap.set("i", "<C-f>", [[pumvisible() ? "\<C-y>" : "\<C-f>"]], { expr = true })
vim.keymap.set("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
vim.keymap.set("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Window resizing
vim.keymap.set("n", "<C-left>", "<C-w><", { noremap = true, silent = true })
vim.keymap.set("n", "<C-down>", "<C-w>-", { noremap = true, silent = true })
vim.keymap.set("n", "<C-up>", "<C-w>+", { noremap = true, silent = true })
vim.keymap.set("n", "<C-right>", "<C-w>>", { noremap = true, silent = true })
