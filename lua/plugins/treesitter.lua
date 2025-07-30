-- return {
-- 	"nvim-treesitter/nvim-treesitter",
-- 	event = { "BufReadPost", "BufNewFile" },
-- 	build = ":TSUpdate",
-- 	opts = {
-- 		ensure_installed = {
-- 			"lua",
-- 			"vimdoc",
-- 			"python",
-- 			"cpp",
-- 			"c",
-- 			"go",
-- 			"javascript",
-- 			"php",
-- 			"markdown",
-- 			"json",
-- 			"yaml",
-- 			"css",
-- 			"dockerfile",
-- 		},
-- 		auto_install = true,
-- 		highlight = { enable = true },
-- 		indent = { enable = true },
-- 	},
-- }

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
}
