return {
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
