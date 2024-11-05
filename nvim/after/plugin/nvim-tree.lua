vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({

	view = {
		width = 60,
		relativenumber = true,
	},

	renderer = {

		indent_markers = {
			enable = true,
		},

		icons = {
			glyphs = {
				folder = {
					arrow_closed = "-",
					arrow_open = "+",
				},
			},
		},
	},

	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
			quit_on_open = true,
		},
	},

	filters = {
		custom = { ".DS_Store" },
	},

	git = {
		ignore = false,
	},
})

local keymap = vim.keymap
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
