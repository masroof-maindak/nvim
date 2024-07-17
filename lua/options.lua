-- Set space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Use system clipboard
vim.o.clipboard = "unnamedplus"

-- Relative line numbers in gutter
vim.o.relativenumber = true

-- Number of spaces per tab
vim.o.tabstop = 4

-- Number of spaces to use for indents with >>, << and ==
vim.o.shiftwidth = 4

-- 24 bit colours
vim.o.termguicolors = true

-- Enable mouse support for all modes
vim.o.mouse = "a"

-- Use local .nvimrc if it exists
vim.opt.exrc = true

-- Disable unsafe commands in local .nvimrc
vim.opt.secure = true

-- Highlight current line
vim.o.cursorline = true

-- Hide ~ at end of buffers
vim.o.fillchars = "eob: "

-- Ensure global statusline is always visible
vim.o.laststatus = 3

-- Always show sign column
vim.o.signcolumn = "yes"

-- Undo files
vim.opt.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Line wrap
vim.o.wrap = false

-- Folding
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.fillchars = "fold: "
function _G.custom_fold_text()
	local line = vim.fn.getline(vim.v.foldstart):gsub("^%s+", "")
	local indent = vim.fn.indent(vim.v.foldstart)
	return string.rep(" ", indent) .. line
end
vim.o.foldtext = "v:lua.custom_fold_text()"

vim.o.updatetime = 300
