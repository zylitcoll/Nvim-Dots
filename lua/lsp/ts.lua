local util = require("lspconfig/util")

-- Cek plugin lokal @astrojs/ts-plugin
local function find_astro_ts_plugin_path(root_dir)
    local path = root_dir .. "/node_modules/@astrojs/ts-plugin"
    if vim.fn.isdirectory(path) == 1 then
        return path
    end
    return nil
end

return {
    root_dir = util.root_pattern("package.json", "tsconfig.json", ".git"),

    on_attach = function(client, bufnr)
        local map = function(mode, lhs, rhs)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
        end

        map("n", "gd", vim.lsp.buf.definition)
        map("n", "K", vim.lsp.buf.hover)
        map("n", "<leader>rn", vim.lsp.buf.rename)

        if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end
    end,

    on_new_config = function(new_config, root_dir)
        local astro_path = find_astro_ts_plugin_path(root_dir)
        if astro_path then
            new_config.settings = new_config.settings or {}
            new_config.settings.vtsls = new_config.settings.vtsls or {}
            new_config.settings.vtsls.tsserver = new_config.settings.vtsls.tsserver or {}

            new_config.settings.vtsls.tsserver.globalPlugins = {
                {
                    name = "@astrojs/ts-plugin",
                    location = astro_path,
                    enableForWorkspaceTypeScriptVersions = true,
                },
            }
        end
    end,

    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "astro",
    },

    settings = {
        typescript = {
            inlayHints = {
                parameterNames = { enabled = "all" },
                variableTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
            },
        },
        javascript = {
            inlayHints = {
                parameterNames = { enabled = "all" },
                variableTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
            },
        },
        vtsls = {
            experimental = {
                enableProjectDiagnostics = true,
            },
        },
    },
}
