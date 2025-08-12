return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup()

		local ensure_installed = {
			"bash",
			"c",
			"cpp",
			"css",
			"devicetree",
			"dockerfile",
			"gitignore",
			"go",
			"html",
			"javascript",
			"javascript",
			"json",
			"kdl",
			"lua",
			"make",
			"markdown",
			"markdown_inline",
			"python",
			"rust",
			"toml",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
		}

		require("nvim-treesitter").install(ensure_installed)
	end,
}
