return {

	-- tmux integration
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
		keys = {
			{ "<C-h>", "<cmd>TmuxNavigateLeft<CR>", "window left" },
			{ "<C-j>", "<cmd>TmuxNavigateUp<CR>", "window up" },
			{ "<C-k>", "<cmd>TmuxNavigateDown<CR>", "window down" },
			{ "<C-l>", "<cmd>TmuxNavigateRight<CR>", "window right" },
		},
	},

	-- better folding
	{
		"chrisgrieser/nvim-origami",
		event = "VeryLazy",
		opts = {}, -- needed even when using default config
	},

	-- also better folding
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		config = function()
			vim.o.foldcolumn = "1" -- '0' is not bad
			vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
			-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
			-- (Note: the `nvim-treesitter` plugin is *not* needed.)
			-- ufo uses the same query files for folding (queries/<lang>/folds.scm)
			-- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" }
				end,
			})
		end,
	},

	-- vertical column
	{ "xiyaowong/virtcolumn.nvim" },

	-- string and hex color previews
	{ "NvChad/nvim-colorizer.lua" },

	-- R stuff
	{ "R-nvim/cmp-r" },

	-- R stuff
	{
		"R-nvim/R.nvim",
		lazy = false,
		config = function()
			local opts = {

				bracketed_paste = true,
				-- external_term = "tmux split-window -h -l 70",

				R_args = { "--quiet", "--no-save" },

				pdfviewer = "xdg-open",

				hook = {
					on_filetype = function()
						vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", {})
						vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", {})
					end,
				},

				-- for vertical split
				min_editor_width = 72,
				rconsole_width = 70,

				-- -- for horizontal split
				-- rconsole_width = 0,
				-- rconsole_height = 20,

				-- other keymaps
				pipe_keymap = "",
				assignment_keymap = "<Localleader>,",

				disable_cmds = {
					"RClearConsole",
					"RCustomStart",
					"RSPlot",
					"RSaveClose",
				},
			}
			if vim.env.R_AUTO_START == "true" then
				opts.auto_start = 1
				opts.objbr_auto_start = true
			end
			require("r").setup(opts)
		end,
	},

	-- R stuff
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("cmp").setup({ sources = { { name = "cmp_r" } } })
			require("cmp_r").setup({})
		end,
	},

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
				transparent = true,
				terminal_colors = false,
			})
		end,
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
				transparent = true,
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
				transparent = true, -- Show/hide background
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
			colorscheme = "darkvoid",
		},
	},
}
