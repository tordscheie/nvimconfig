return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		-- or                            , branch = '0.1.x',
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>fd", builtin.find_files, {})
			vim.keymap.set("n", "<leader>ff", builtin.treesitter, {})
			vim.keymap.set("n", "<Space>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<Space>fh", builtin.help_tags, {})
			vim.keymap.set("n", "<Space>fm", builtin.marks, {})
			vim.keymap.set("n", "<Space>fr", builtin.registers, {})
			vim.keymap.set("n", "<leader>en", function()
				builtin.find_files({
					cwd = vim.fn.stdpath("config"),
				})
			end)
			vim.keymap.set(
				"n",
				"<leader>fw",
				require("telescope.builtin").grep_string,
				{ desc = "Search current Word" }
			)
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",

		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				pickers = {
					coloscheme = {
						enable_preveiw = true,
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
