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
	{ "norcalli/nvim-colorizer.lua" },

	-- smooth scrolling
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({
				mappings = { -- Keys to be mapped to their corresponding default scrolling animation
					"<C-u>",
					"<C-d>",
					"<C-b>",
					"<C-f>",
					"<C-y>",
					"<C-e>",
					"zt",
					"zz",
					"zb",
				},
				-- Hide cursor while scrolling
				hide_cursor = true,
				-- Stop at <EOF> when scrolling downwards
				stop_eof = true,
				-- Stop scrolling when the cursor reaches the scrolloff margin of the
				-- file
				respect_scrolloff = true,
				-- The cursor will keep on scrolling even if the window cannot scroll
				-- further
				cursor_scrolls_alone = false,
				easing = "circular", -- Default easing function
				performance_mode = false, -- Disable "Performance Mode" on all buffers.
			})
		end,
	},

	-- R stuff
	{ "R-nvim/cmp-r" },

	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {
			code = {
				sign = false,
				width = "block",
				right_pad = 1,
				style = "none",
			},
			heading = {
				sign = false,
				icons = {},
			},
		},
		ft = { "markdown", "norg", "rmd", "org" },
		config = function(_, opts)
			require("render-markdown").setup(opts)
			LazyVim.toggle.map("<leader>um", {
				name = "Render Markdown",
				get = function()
					return require("render-markdown.state").enabled
				end,
				set = function(enabled)
					local m = require("render-markdown")
					if enabled then
						m.enable()
					else
						m.disable()
					end
				end,
			})
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

	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("cmp").setup({ sources = { { name = "cmp_r" } } })
			require("cmp_r").setup({})
		end,
	},
}
