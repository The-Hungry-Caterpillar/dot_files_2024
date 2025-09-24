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
				colors = {
					plugins = {
						lualine = false,
					},
				},
			})
		end,
	},

	{
		"sontungexpt/witch",
		priority = 1000,
		lazy = false,
		-- config = function(_, opts)
		-- 	require("witch").setup(opts)
		-- end,
	},

	{ "Verf/deepwhite.nvim", priority = 1000 },

	{ "Mofiqul/vscode.nvim", priority = 1000 },

	{ "rebelot/kanagawa.nvim", priority = 1000 },

	{ "rose-pine/neovim", name = "rose-pine", priority = 1000 },

	{
		"Shatur/neovim-ayu",
		priority = 1000,
		config = function()
			require("ayu").setup({})
		end,
	},

	{
		"ishan9299/nvim-solarized-lua",
		priority = 1000,
	},

	{
		"folke/tokyonight.nvim",
		opts = {
			transparent = false,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
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
		"szammyboi/dune.nvim",
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

	{},

	{
		"projekt0n/github-nvim-theme",
		lazy = false,
		priority = 1000,
		config = function()
			require("github-theme").setup({
				options = {
					transparent = false,
				},
			})
		end,
	},

	-- Using Lazy
	{
		"navarasu/onedark.nvim",
		priority = 1000,
		config = function()
			require("onedark").setup({
				style = "light",
				-- style = "dark",
				-- style = "cool",
				-- style = "deep",
			})
		end,
	},

	{
		"sainnhe/everforest",
		priority = 1000,
		config = function()
			vim.g.everforest_enable_italic = true
			vim.g.everforest_background = "soft"
			-- vim.g.everforest_background = "medium"
			-- vim.g.everforest_background = "easy"
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
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},

	{
		"LazyVim/LazyVim",
		opts = {
			-- colorscheme = "github_light",
			-- colorscheme = "solarized-osaka",
			-- colorscheme = "darkvoid",
			colorscheme = "dracula",
		},
	},
}
