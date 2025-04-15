return {
    -- 🌈 Tema Catppuccin
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- mocha, macchiato, frappe, latte
                integrations = {
                    treesitter = true,
                    telescope = true,
                    nvimtree = true,
                    bufferline = true,
                    gitsigns = true,
                },
            })
            vim.cmd.colorscheme("catppuccin-mocha")
        end,
    },

    -- 🧠 Git signs
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = "│" },
                    change = { text = "│" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                },
            })
        end,
    },

    -- 📦 Status Line (bawah)
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "catppuccin",
                    icons_enabled = true,
                    section_separators = { left = "", right = "" },
                    component_separators = { left = "", right = "" },
                    globalstatus = true,
                },
            })
        end,
    },

    -- 📁 Sidebar (Explorer)
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup({
                view = {
                    side = "left",
                    width = 25,
                },
                renderer = {
                    highlight_git = true,
                    highlight_opened_files = "all",
                    root_folder_label = ":~",
                },
                git = {
                    enable = true,
                },
            })
        end,
    },

    -- 🔍 Fuzzy Finder (Telescope + fzf)
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                cond = vim.fn.executable("make") == 1,
            },
        },
        config = function()
            local telescope = require("telescope")
            telescope.setup({
                defaults = {
                    layout_config = {
                        horizontal = {
                            preview_width = 0.55,
                        },
                    },
                    mappings = {
                        i = {
                            ["<C-j>"] = "move_selection_next",
                            ["<C-k>"] = "move_selection_previous",
                        },
                    },
                },
            })
            pcall(telescope.load_extension, "fzf")
        end,
    },

    {
        "akinsho/bufferline.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("bufferline").setup({
                options = {
                    mode = "buffers",
                    show_close_icon = false,
                    show_buffer_close_icons = true,
                    separator_style = "slant",
                    always_show_bufferline = true,
                    color_icons = true,
                    diagnostics = "nvim_lsp",
                    diagnostics_update_in_insert = false,
                    diagnostics_indicator = function(count, level, _, _)
                        local icon = level:match("error") and " " or " "
                        return " " .. icon .. count
                    end,
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "File Explorer",
                            highlight = "Directory",
                            text_align = "left",
                            separator = true,
                        },
                    },
                },
            })
        end,
    },


    -- 🖥️ Terminal pop-up
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                size = 20,
                open_mapping = [[<c-\>]],
                direction = "float",
                float_opts = {
                    border = "curved",
                },
            })
        end,
    },
}
