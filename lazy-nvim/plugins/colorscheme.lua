return {

	{ "bartekjaszczak/finale-nvim", priority = 1000 },

	{ "NTBBloodbath/doom-one.nvim", priority = 1000 },

	{
		"Aliqyan-21/darkvoid.nvim",
		priority = 1000,
		config = function()
			require("darkvoid").setup({
				transparent = true,
				glow = true,
				colors = {
					plugins = {
						lualine = false,
					},
				},
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
				transparent_background = true,
			})
		end,
	},

	{
		"folke/tokyonight.nvim",
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
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
			transparent_bg = true,
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
		"projekt0n/github-nvim-theme",
		lazy = false,
		priority = 1000,
		config = function()
			require("github-theme").setup({
				options = {
					transparent = true,
				},
			})
		end,
	},

	{
		"LazyVim/LazyVim",
		opts = {
			-- colorscheme = "vscode",
			-- colorscheme = "tokyonight-night",
			-- colorscheme = "github_dark_dimmed",
			-- colorscheme = "darkvoid",
			-- colorscheme = "catppuccin-mocha",
			-- colorscheme = "solarized-osaka",
			colorscheme = "dracula",
		},
	},
}
