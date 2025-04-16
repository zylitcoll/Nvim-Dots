return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					javascript = { "prettier" },
					javascriptreact = { "prettier" },
					typescript = { "prettier" },
					typescriptreact = { "prettier" },
					vue = { "prettier" },
					svelte = { "prettier" },
					css = { "prettier" },
					scss = { "prettier" },
					less = { "prettier" },
					html = { "prettier" },
					json = { "prettier" },
					yaml = { "prettier" },
					markdown = { "prettier" },
					astro = { "prettier" },
					lua = { "stylua" },
					php = { "php_cs_fixer" },
					python = { "black" },
				},
				format_on_save = {
					lsp_fallback = true,
				},
			})
		end,
	},

	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					-- PHP
					null_ls.builtins.formatting.phpcsfixer.with({
						extra_args = { "--rules=@PSR12" }, -- contoh tambahan argumen
					}),

					-- JavaScript/TypeScript/HTML/CSS
					null_ls.builtins.formatting.prettier.with({
						prefer_local = "node_modules/.bin", -- prioritaskan Prettier lokal
						extra_filetypes = { "astro", "svelte" }, -- tambahkan jika perlu
					}),

					-- Python
					null_ls.builtins.formatting.black.with({
						extra_args = { "--fast" }, -- contoh argumen tambahan
					}),

					-- Lua
					null_ls.builtins.formatting.stylua.with({
						extra_args = { "--indent-width", "2", "--indent-type", "Spaces" },
					}),
				},
			})
		end,
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufWritePost" },
		config = function()
			require("lint").linters_by_ft = {
				astro = { "eslint_d" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
			}
		end,
	},
}
