return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local lspconfig = require("lspconfig")

        -- Emmet Language Server
        lspconfig.emmet_language_server.setup({
            filetypes = {
                "html", "php", "css", "scss", "sass", "javascript", "javascriptreact",
                "typescript", "typescriptreact", "vue", "svelte", "astro"
            },
            init_options = {
                html = {
                    options = {
                        ["bem.enabled"] = true,
                    },
                },
            },
        })

        -- Tailwind CSS Language Server
        lspconfig.tailwindcss.setup({
            filetypes = {
                "html", "css", "scss", "javascript", "javascriptreact",
                "typescript", "typescriptreact", "vue", "svelte", "astro"
            },
            init_options = {
                userLanguages = {
                    eelixir = "html",
                    eruby = "html",
                },
            },
            settings = {
                tailwindCSS = {
                    experimental = {
                        classRegex = {
                            { "tw`([^`]*)",       1 },
                            { 'tw="([^"]*)',      1 },
                            { "tw-{.*?}`([^`]*)", 1 },
                            { "class:([^=]+)",    1 },
                        },
                    },
                },
            },
        })

        --Php
        lspconfig.intelephense.setup({
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })


        -- TypeScript / JavaScript via vtsls
        lspconfig.vtsls.setup(require("lsp.ts"))

        -- Vue 3
        lspconfig.volar.setup({
            filetypes = { "typescript", "javascript", "vue" },
        })

        -- Svelte
        lspconfig.svelte.setup({})

        -- Astro
        lspconfig.astro.setup({})


        -- Python
        lspconfig.pyright.setup({
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })





        -- Lainnya
        lspconfig.html.setup({})
        lspconfig.cssls.setup({})
        lspconfig.jsonls.setup({})
        lspconfig.eslint.setup({})
    end,
}
