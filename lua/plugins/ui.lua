return {
	-- Theme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup()
			vim.cmd.colorscheme("catppuccin")
		end
	},


	--  Sidebar (Explorer)
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
				sync_root_with_cwd = true,
				update_focused_file = {
					enable = true,
					update_root = true,
				},
				on_attach = function(bufnr)
					local api = require("nvim-tree.api")

					--  Panggil keymap default dulu
					api.config.mappings.default_on_attach(bufnr)

					local function opts(desc)
						return {
							desc = "nvim-tree: " .. desc,
							buffer = bufnr,
							noremap = true,
							silent = true,
							nowait = true,
						}
					end

					-- Tekan `.` untuk set folder sebagai root
					vim.keymap.set("n", ".", function()
						local node = api.tree.get_node_under_cursor()
						if node and node.type == "directory" then
							api.tree.change_root_to_node()
						else
							vim.notify("Bukan folder!", vim.log.levels.WARN)
						end
					end, opts("Set folder as root"))

					-- Tekan `-` untuk kembali ke folder sebelumnya (parent)
					vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts("Go to parent folder"))
				end,
			})
		end,
	},

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = { theme = "catppuccin" }
			})
		end
	},

	-- Bufferline (Tab navigasi)
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("bufferline").setup()
		end
	},

	-- Indent guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {}
	},

	-- Dashboard
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end
	},

	-- Notification
	{
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")
		end
	},

	-- Fancy UI for command/message/LSP
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify"
		}
	},

	-- Fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		dependencies = { "nvim-lua/plenary.nvim" }
	},

	-- Which-key
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
		end
	},


	--  Terminal pop-up
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
