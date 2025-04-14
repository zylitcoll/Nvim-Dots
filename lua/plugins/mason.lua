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
                },
                automatic_installation = true,
            })
        end,
    },
}
