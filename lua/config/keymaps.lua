-- Save file in Normal mode
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })

-- Save file in Insert mode (Ctrl+S)
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', 'u', { noremap = true, silent = true })     -- Undo
vim.api.nvim_set_keymap('n', '<C-y>', '<C-r>', { noremap = true, silent = true }) -- Redo

-- Undo (Insert Mode)
vim.api.nvim_set_keymap('i', '<C-u>', '<Esc>u', { noremap = true, silent = true })

-- Redo (Insert Mode)
vim.api.nvim_set_keymap('i', '<C-y>', '<Esc><C-r>', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle Explorer" })
vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })
