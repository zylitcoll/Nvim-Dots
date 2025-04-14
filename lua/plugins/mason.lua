return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "intelephense",
                    "vtsls",
                    "volar",
                    "svelte",
                    "astro",
                    "html",
                    "cssls",
                    "jsonls",
                    "eslint",
                    "emmet_language_server",
                    "tailwindcss",
                    "pyright",
                    "lua_ls",
                },
                automatic_installation = true,
            })
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim", -- ✅ opsional tapi berguna
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    "prettier",   -- ✅ formatter
                    "eslint-lsp", -- ✅ linter (non-LSP)
                    "stylua",
                    "php-cs-fixer",
                    "black",
                },
                automatic_installation = true,
                auto_update = false,
                run_on_start = true,
                start_delay = 3000, -- ms
            })
        end,
    },
}
