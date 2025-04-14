-- Auto format saat save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.py", "*.php", "*.js", "*.ts", "*.html", "*.css", "*.json", "*.lua" },
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})
