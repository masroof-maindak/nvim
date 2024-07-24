-- Set space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Use system clipboard
vim.o.clipboard = "unnamedplus"

-- Relative line numbers in gutter
vim.o.relativenumber = true
vim.o.number = true

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

-- Ensure global statusline is always visible
vim.o.laststatus = 3

-- Always show sign column
vim.o.signcolumn = "auto"

-- Undo files
vim.opt.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.infercase = true
vim.o.smartcase = true

-- Line wrap
vim.o.wrap = false

-- Folding
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldmethod = "syntax"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
function _G.custom_fold_text()
	local line = vim.fn.getline(vim.v.foldstart):gsub("^%s+", "")
	local indent = vim.fn.indent(vim.v.foldstart)
	return string.rep(" ", indent) .. line
end
vim.o.foldtext = "v:lua.custom_fold_text()"

-- Hide fold and and end-of-buffer default chars
vim.o.fillchars = "eob: ,fold: "

vim.o.updatetime = 300

-- Show hidden characters
vim.opt.listchars = {
	tab = '∙∙',  -- Display tabs as a bullet point (•)
	trail = '~', -- Display trailing spaces as '.'
}
vim.opt.list = true

