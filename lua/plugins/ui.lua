return {
    -- Tema Catppuccin
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("catppuccin-mocha")
        end,
    },

    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = true,
    },

    -- Tabline (mirip tab atas di VSCode)
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("bufferline").setup()
        end,
    },

    -- Sidebar file explorer
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup({
                view = {
                    side = "left", -- Posisikan di sebelah kiri
                    width = 30,    -- Lebar sidebar
                },
                renderer = {
                    root_folder_label = ":~",       -- Menampilkan nama folder root
                    highlight_git = true,           -- Menampilkan status Git
                    highlight_opened_files = "all", -- Memberikan highlight pada file yang terbuka
                },
            })

            -- Keybinding untuk toggle sidebar
            vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle Explorer" })
        end,
    },



    -- Terminal (CTRL+\ atau <leader>t)
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup()
            vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })
        end,
    },
}
