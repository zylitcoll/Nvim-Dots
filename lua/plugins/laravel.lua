return {
	{
		"adalessa/laravel.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"tpope/vim-dotenv",
			"MunifTanjim/nui.nvim",
			"nvimtools/none-ls.nvim", -- optional untuk format
			"kevinhwang91/promise-async",
		},
		cmd = { "Artisan" },
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
	{
		"jwalton512/vim-blade",
		ft = "blade",
		config = function()
			vim.cmd([[
            autocmd FileType blade setlocal shiftwidth=2 tabstop=2
          ]])
		end,
	},
}
