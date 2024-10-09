local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	-- essential plugins
	{ 
		"nvim-telescope/telescope.nvim",
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
        lazy = true
	},
    
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        lazy = false
    },

    {
        "nvimdev/indentmini.nvim",
        config = function()
            require("indentmini").setup()
        end
    },

    {
        "ggandor/leap.nvim",
        config = function()
            local leap = require('leap')
            leap.add_default_mappings()
            leap.opts.case_sensitive = false
        end
    },

    -- {
    --     "HiPhish/rainbow-delimiters.nvim"
    -- },

    {
        'm4xshen/autoclose.nvim'
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    {
        "karb94/neoscroll.nvim"
    },

    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            insert_at_start = false,
        },
    },

    {
        "NvChad/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end
    },

    {
        "kdheepak/lazygit.nvim",
        config = function()
            require("telescope").load_extension("lazygit")
        end,
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    },

    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
        keys = {
            { "<C-h>", "<cmd>TmuxNavigateLeft<CR>", "window left"},
            { "<C-j>", "<cmd>TmuxNavigateUp<CR>", "window up"},
            { "<C-k>", "<cmd>TmuxNavigateDown<CR>", "window down"},
            { "<C-l>", "<cmd>TmuxNavigateRight<CR>", "window right"}
        }
    },

    {
        'stevearc/dressing.nvim'
    },

    {
        'xiyaowong/virtcolumn.nvim'
    },

    -- {
    --     "miversen33/sunglasses.nvim"
    -- },

	-- {
	-- 	'mbbill/undotree',
	-- 	lazy = false
	-- },

	-- {
	-- 	'tpope/vim-fugitive',
	-- 	lazy = false
	-- },


	-- r plugins
	{ "R-nvim/cmp-r" },

	{
		"R-nvim/R.nvim",
		lazy = false,
        config = function()
            local opts = {
                bracketed_paste = true,
                -- external_term = "tmux split-window -h -l 70",
                R_args = {"--quiet", "--no-save"},
                hook = {
                    on_filetype = function ()
                        vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", {})
                        vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", {})
                    end
                },
                -- for vertical split
                min_editor_width = 72,
                rconsole_width = 70,
                nosplitright = true,
                -- -- for horizontal split
                -- rconsole_width = 0,
                -- rconsole_height = 20,
                -- other keymaps
                pipe_keymap = '',
                assignment_keymap = '<Localleader>,',
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
        end
	},

	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("cmp").setup({ sources = {{ name = "cmp_r" }}})
			require("cmp_r").setup({ })
		end,
	},

	-- color themes

    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    { "folke/tokyonight.nvim" },
    
    { "savq/melange-nvim", },

    { "navarasu/onedark.nvim" },

    { 'paulo-granthon/hyper.nvim' },

    { 'NLKNguyen/papercolor-theme' },

    { 'yorickpeterse/vim-paper', name = 'paper'},

    { 
        'rebelot/kanagawa.nvim',
        config = function()
            require('kanagawa').setup({
                transparent = false
            })
        end
    },

    
    {
        "Aliqyan-21/darkvoid.nvim",
        config = function()
            require("darkvoid").setup({
                transparent = false,
                glow = true
            })
        end
    },

    {
        "Mofiqul/dracula.nvim",
        opts = {
            transparent_bg = true,
            italic_comment = true
        }
    },

    {
        "craftzdog/solarized-osaka.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = false
        },
    },

    {
        "sainnhe/sonokai",
        config = function()
            -- Optionally configure and load the colorscheme
            -- directly inside the plugin declaration.
            vim.g.sonokai_enable_italic = true
            vim.g.sonokai_style = "andromeda"
        end
    },

    {
        "killitar/obscure.nvim",
        lazy = false,
        priority = 1000,
        opts = {}
    }

})
