return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		-- You must call setup on the configurations module
		require("nvim-treesitter.configs").setup({
			-- Pass your languages as a list to ensure_installed
			ensure_installed = { "c", "python", "lua" },
			-- Enable syntax highlighting (highly recommended)
			highlight = {
				enable = true,
			},
		})
	end,
}
