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

	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.zenbones_darken_comments = 45
		end,
	},

	{ "Verf/deepwhite.nvim", priority = 1000 },

	{ "Mofiqul/vscode.nvim", priority = 1000 },

	{ "rebelot/kanagawa.nvim", priority = 1000 },

	{ "hachy/eva01.vim", priority = 1000 },

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

	{ "ribru17/bamboo.nvim" },

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
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin-mocha",
		},
	},
}
