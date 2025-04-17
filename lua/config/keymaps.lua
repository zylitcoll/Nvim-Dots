-- Save file in Normal mode
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })

-- Save file in Insert mode (Ctrl+S)
vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "u", { noremap = true, silent = true }) -- Undo
vim.api.nvim_set_keymap("n", "<C-y>", "<C-r>", { noremap = true, silent = true }) -- Redo

-- Undo (Insert Mode)
vim.api.nvim_set_keymap("i", "<C-u>", "<Esc>u", { noremap = true, silent = true })

-- Redo (Insert Mode)
vim.api.nvim_set_keymap("i", "<C-y>", "<Esc><C-r>", { noremap = true, silent = true })

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

-- Visual mode: Duplikat blok ke bawah
vim.keymap.set("v", "<A-J>", "y'>p`[V`]", { desc = "Copy block below" })

-- Visual mode: Duplikat blok ke atas
vim.keymap.set("v", "<A-K>", "y'<P`[V`]", { desc = "Copy block above" })

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle Explorer" })
vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })
