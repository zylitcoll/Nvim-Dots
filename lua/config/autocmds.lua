vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.py", "*.php", "*.js", "*.ts", "*.html", "*.css", "*.json", "*.lua", "*.astro" },
    callback = function(args)
        require("conform").format({
            bufnr = args.buf,
            async = false,
            lsp_fallback = true,
        })
    end,
})
