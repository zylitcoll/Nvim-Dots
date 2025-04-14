return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- PHP
                null_ls.builtins.formatting.phpcsfixer, -- butuh: composer global require friendsofphp/php-cs-fixer

                -- JavaScript / TypeScript / HTML / CSS
                null_ls.builtins.formatting.prettier, -- butuh: npm install -g prettier

                -- Python
                null_ls.builtins.formatting.black, -- butuh: pip install black

                -- Lua
                null_ls.builtins.formatting.stylua, -- butuh: cargo install stylua

                -- JSON / YAML
                null_ls.builtins.formatting.prettier,
            },
        })
    end,
}
