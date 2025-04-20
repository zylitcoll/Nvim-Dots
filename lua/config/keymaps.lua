-- Save file in Normal mode
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })

-- Save file in Insert mode (Ctrl+S)
vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })

-- Undo (Insert Mode)
vim.api.nvim_set_keymap("i", "<C-u>", "<Esc>u", { noremap = true, silent = true })

-- slect all
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true })
vim.keymap.set("i", "<C-a>", "<Esc>ggVG", { noremap = true, silent = true })

-- Redo (Insert Mode)
vim.api.nvim_set_keymap("i", "<C-r>", "<Esc><C-r>", { noremap = true, silent = true })

-- Normal mode: Pindah baris ke bawah
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })

-- Normal mode: Pindah baris ke atas
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })

-- Normal mode: Duplikat baris ke bawah
vim.keymap.set("n", "<A-J>", "yyp", { desc = "Copy line below" })

-- Normal mode: Duplikat baris ke atas
vim.keymap.set("n", "<A-K>", "yyP", { desc = "Copy line above" })

-- Visual mode: Pindahkan blok ke bawah
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move block down" })

-- Visual mode: Pindahkan blok ke atas
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move block up" })

-- Duplikat blok ke bawah (Visual mode)
vim.keymap.set("v", "<A-J>", ":<C-u>lua DuplicateVisualBlock('down')<CR>", { desc = "Duplicate block down" })

-- Duplikat blok ke atas (Visual mode)
vim.keymap.set("v", "<A-K>", ":<C-u>lua DuplicateVisualBlock('up')<CR>", { desc = "Duplicate block up" })

function DuplicateVisualBlock(direction)
	-- Simpan posisi visual selection
	local start_line = vim.fn.line("'<")
	local end_line = vim.fn.line("'>")

	-- Ambil isi baris yang diseleksi
	local lines = vim.fn.getline(start_line, end_line)

	-- Duplikat ke atas atau ke bawah
	if direction == "down" then
		vim.fn.append(end_line, lines)
	elseif direction == "up" then
		vim.fn.append(start_line - 1, lines)
	end

	-- Kembalikan mode visual ke blok baru
	vim.cmd("normal! gv")
end

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle Explorer" })
vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })

local api = require("Comment.api")

-- Normal mode: comment 1 baris
vim.keymap.set("n", "<C-;>", function()
	api.toggle.linewise.current()
end, { noremap = true, silent = true })

-- Visual mode: comment blok terpilih
vim.keymap.set("v", "<C-;>", "<Esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", {
	noremap = true,
	silent = true,
})
