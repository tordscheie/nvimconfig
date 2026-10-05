require("config.lazy")
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

vim.g.mapleader = " "
vim.opt.mouse = "a"
vim.opt.cursorline = true
vim.opt.undofile = true
vim.opt.splitright = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 10
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.wo.relativenumber = false
vim.wo.number = true

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
--Keymaps
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<D-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<D-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<D-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<D-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<D-p>", ":Neotree filesystem toggle left<CR>")
vim.keymap.set("n", "<leader>sr", ":vsplit<CR>")

-- LSP Maps


vim.keymap.set("n", "<leader>n", vim.lsp.buf.rename, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Smart Rename" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "E", vim.diagnostic.open_float, {})
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})
-- Telescope Keymaps

-- Custom autocmd
--
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
