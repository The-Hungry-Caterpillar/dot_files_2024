return {
	-- color schemes
	{ "yorickpeterse/vim-paper", name = "paper", priority = 1000 },
	{ "shaunsingh/nord.nvim", priority = 1000 },
	{ "AlexvZyl/nordic.nvim", priority = 1000 },
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("solarized-osaka").setup({
				transparent = false,
				terminal_colors = false,
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = {
			style = "night",
			transparent = false,
		},
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				transparent = false,
			})
		end,
	},
	{
		"Aliqyan-21/darkvoid.nvim",
		priority = 1000,
		config = function()
			require("darkvoid").setup({
				transparent = false,
				glow = true,
				colors = {
					-- search_highlight = "#429EFF",
					-- operator = "#429EFF",
				},
			})
		end,
	},
	{
		"ribru17/bamboo.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("bamboo").setup({
				style = "vulgaris", -- Choose between 'vulgaris' (regular), 'multiplex' (greener), and 'light'
				transparent = false, -- Show/hide background
				dim_inactive = false, -- Dim inactive windows/buffers
			})
		end,
	},
	{
		"Mofiqul/dracula.nvim",
		priority = 1000,
		opts = {
			transparent_bg = false,
			italic_comment = true,
		},
	},

	-- set color scheme
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "paper",
		},
	},
}
