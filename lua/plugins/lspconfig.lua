return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "saghen/blink.cmp"
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {"clangd", "lua_ls", "basedpyright"}
        })
        -- Adds cmp_nvim_lsp as a completion engine
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        vim.lsp.config('clangd', {capabilities = capabilities})
        vim.lsp.enable('clangd')

        vim.lsp.config('lua_ls', {capabilities = capabilities})
        vim.lsp.enable('lua_ls')

        vim.lsp.config('basedpyright', {capabilities = capabilities})
        vim.lsp.enable('base')

        end,
    }
