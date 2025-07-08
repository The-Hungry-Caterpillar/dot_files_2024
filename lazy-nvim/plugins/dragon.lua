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

	-- {
	--     "akinsho/bufferline.vim",
	--     config = function()
	--
	--     end
	-- },

	-- vertical column
	{ "xiyaowong/virtcolumn.nvim" },

	-- string and hex color previews
	{ "norcalli/nvim-colorizer.lua" },

	-- -- smooth scrolling
	-- {
	-- 	"karb94/neoscroll.nvim",
	-- 	config = function()
	-- 		require("neoscroll").setup({
	-- 			mappings = { -- Keys to be mapped to their corresponding default scrolling animation
	-- 				"<C-u>",
	-- 				"<C-d>",
	-- 				"<C-b>",
	-- 				"<C-f>",
	-- 				"<C-y>",
	-- 				"<C-e>",
	-- 				"zt",
	-- 				"zz",
	-- 				"zb",
	-- 			},
	-- 			-- Hide cursor while scrolling
	-- 			hide_cursor = true,
	-- 			-- Stop at <EOF> when scrolling downwards
	-- 			stop_eof = true,
	-- 			-- Stop scrolling when the cursor reaches the scrolloff margin of the
	-- 			-- file
	-- 			respect_scrolloff = true,
	-- 			-- The cursor will keep on scrolling even if the window cannot scroll
	-- 			-- further
	-- 			cursor_scrolls_alone = false,
	-- 			easing = "circular", -- Default easing function
	-- 			performance_mode = false, -- Disable "Performance Mode" on all buffers.
	-- 		})
	-- 	end,
	-- },

	-- R stuff
	-- { "R-nvim/cmp-r" },

	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown", "norg", "rmd", "org", "Rmd" },
		opts = {
			code = {
				sign = false,
				width = "block",
				right_pad = 1,
				style = "none",
				disable_background = true,
			},
			heading = {
				sign = false,
				icons = {},
			},
		},
		config = function(_, opts)
			require("render-markdown").setup(opts)
		end,
	},

	{
		"R-nvim/R.nvim",
		lazy = false,
		config = function()
			local opts = {

				bracketed_paste = true,
				-- external_term = "tmux split-window -h -l 70",

				R_args = { "--quiet", "--no-save" },

				pdfviewer = "xdg-open",

				quarto_chunk_hl = {
					highlight = false,
					bg = "#222222",
				},

				hook = {
					on_filetype = function()
						vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", {})
						vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", {})
						vim.api.nvim_buf_set_keymap(0, "i", "fd", "<Plug>RInsertAssign", { noremap = true })
					end,
				},

				-- for vertical split
				min_editor_width = 72,
				rconsole_width = 80,

				-- -- for horizontal split
				-- rconsole_width = 0,
				-- rconsole_height = 40,

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

	-- {
	-- 	"nvim-lualine/lualine.nvim",
	-- 	config = function()
	-- 		require("lualine").setup({
	-- 			options = {
	-- 				icons_enabled = true,
	-- 				theme = "iceberg_dark",
	-- 			},
	-- 		})
	-- 	end,
	-- },

	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("cmp").setup({ sources = { { name = "cmp_r" } } })
			require("cmp_r").setup({})
		end,
	},

	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = { -- set to setup table
			filetypes = { "*" },
		},
	},

	-- {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	keys = {
	-- 		{
	-- 			"<leader>fE",
	-- 			function()
	-- 				require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
	-- 			end,
	-- 			desc = "Explorer NeoTree (Root Dir)",
	-- 		},
	-- 		{
	-- 			"<leader>fe",
	-- 			function()
	-- 				require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
	-- 			end,
	-- 			desc = "Explorer NeoTree (cwd)",
	-- 		},
	-- 		{ "<leader>E", "<leader>fE", desc = "Explorer NeoTree (Root Dir)", remap = true },
	-- 		{ "<leader>e", "<leader>fe", desc = "Explorer NeoTree (cwd)", remap = true },
	-- 		{
	-- 			"<leader>ge",
	-- 			function()
	-- 				require("neo-tree.command").execute({ source = "git_status", toggle = true })
	-- 			end,
	-- 			desc = "Git Explorer",
	-- 		},
	-- 		{
	-- 			"<leader>be",
	-- 			function()
	-- 				require("neo-tree.command").execute({ source = "buffers", toggle = true })
	-- 			end,
	-- 			desc = "Buffer Explorer",
	-- 		},
	-- 	},
	-- },
}
