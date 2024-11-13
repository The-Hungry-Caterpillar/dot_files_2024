return {
	-- color schemes
	{ "yorickpeterse/vim-paper", name = "paper", priority = 1000 },
	{
		"Aliqyan-21/darkvoid.nvim",
		priority = 1000,
		config = function()
			require("darkvoid").setup({
				transparent = false,
				glow = true,
				-- colors = {
				-- 	search_highlight = "#9BEC00",
				-- 	cursor = "#9BEC00",
				-- 	operator = "#059212",
				-- 	constant = "#06D001",
				-- 	bool = "#06D001",
				-- 	preprocessor = "#06D001",
				-- },
			})
		end,
	},
	{
		"zenbones-theme/zenbones.nvim",
		-- Optionally install Lush. Allows for more configuration or extending the colorscheme
		-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
		-- In Vim, compat mode is turned on as Lush only works in Neovim.
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.zenbones_darken_comments = 45
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
	{
		"bartekjaszczak/finale-nvim",
		priority = 1000,
	},
	-- set color scheme
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "finale",
		},
	},
}
