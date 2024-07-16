-- Set space as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Use system clipboard
vim.o.clipboard = 'unnamedplus'

-- Relative line numbers in gutter
vim.o.relativenumber = true

-- Number of spaces per tab
vim.o.tabstop = 4

-- Number of spaces to use for indents with >>, << and ==
vim.o.shiftwidth = 4

-- 24 bit colours
vim.o.termguicolors = true

-- Enable mouse support for all modes
vim.o.mouse = 'a'

-- Use local .nvimrc if it exists
vim.opt.exrc = true

-- Disable unsafe commands in local .nvimrc
vim.opt.secure = true

-- Highlight current line
vim.o.cursorline = true

-- Hide ~ at end of buffers
vim.o.fillchars = 'eob: '

-- Ensure global statusline is always visible
vim.o.laststatus = 3

-- Always show sign column
vim.o.signcolumn = 'yes'

-- Undo files
vim.opt.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Line wrap
vim.o.wrap = false

vim.o.updatetime = 300
