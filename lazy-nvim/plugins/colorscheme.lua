return {

	{ "bartekjaszczak/finale-nvim", priority = 1000 },

	{ "NTBBloodbath/doom-one.nvim", priority = 1000 },

	{
		"Aliqyan-21/darkvoid.nvim",
		priority = 1000,
		config = function()
			require("darkvoid").setup({
				transparent = false,
				glow = true,
			})
		end,
	},

	{ "Verf/deepwhite.nvim", priority = 1000 },

	{ "Mofiqul/vscode.nvim", priority = 1000 },

	{ "rebelot/kanagawa.nvim", priority = 1000 },

	{ "rose-pine/neovim", name = "rose-pine", priority = 1000 },

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = false,
			})
		end,
	},

	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = false,
		},
	},

	{
		"Mofiqul/dracula.nvim",
		priority = 1000,
		opts = {
			transparent_bg = false,
			italic_comment = true,
		},
	},

	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
	},

	{
		"profesorpaiche/toytiza.nvim",
		lazy = false,
		priority = 1000,
	},

	{
		"alexxGmZ/e-ink.nvim",
		lazy = false,
		priority = 1000,
	},

	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "e-ink",
			-- colorscheme = "solarized-osaka",
			-- colorscheme = "dracula",
		},
	},
}
