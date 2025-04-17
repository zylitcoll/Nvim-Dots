vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
	pattern = "NvimTree_*",
	callback = function()
		vim.defer_fn(function()
			if vim.fn.mode() == "i" then
				vim.cmd("stopinsert")
			end
		end, 20)
	end,
})
