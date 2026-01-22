return {
	"nvim-tree/nvim-tree.lua",
	version = "*", -- Use stable version
	lazy = false, -- Load immediately
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		vim.opt.termguicolors = true

		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
				side = "left",
				preserve_window_proportions = false,
				adaptive_size = false,
			},
			renderer = {
				group_empty = true,
				add_trailing = false,
				highlight_git = true,
				highlight_opened_files = "none",
				root_folder_label = ":~:s?$?/..?",
				indent_width = 2,
				indent_markers = {
					enable = true,
					inline_arrows = true,
					icons = {
						corner = "└",
						edge = "│",
						item = "│",
						bottom = "─",
						none = " ",
					},
				},
				icons = {
					webdev_colors = true,
					git_placement = "before",
					padding = " ",
					symlink_arrow = " ➛ ",
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
					glyphs = {
						default = "",
						symlink = "",
						bookmark = "󰆤",
						folder = {
							arrow_closed = "▶", -- closed folder icon
							arrow_open = "▼", -- open folder icon
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
			filters = {
				dotfiles = false,
				git_ignored = false, -- Show gitignored files
				custom = { "^.git$" },
			},
			actions = {
				open_file = {
					resize_window = true,
					quit_on_open = false,
				},
			},
			update_focused_file = {
				enable = true,
				update_root = false,
			},
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			tab = {
				sync = {
					open = false,
					close = false,
				},
			},
		})

		local keymap = vim.keymap
		local api = require("nvim-tree.api")

		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>")
		keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>")
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>")
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>")
		keymap.set("n", "<leader>ea", function()
			api.tree.expand_all()
		end)
		keymap.set("n", "<leader>et", function()
			if vim.fn.bufname() == "NvimTree_" .. vim.fn.tabpagenr() then
				vim.cmd("wincmd p")
			else
				api.tree.focus()
			end
		end)
		keymap.set("n", "<BS>", function()
			api.node.navigate.parent()
		end)
	end,
}
