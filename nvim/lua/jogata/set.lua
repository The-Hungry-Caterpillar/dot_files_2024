-- Change leader key to comma
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Fat cursor
vim.opt.guicursor = ""
-- Line numbers, relative
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tab settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.g.r_indent_align_args = 0

vim.opt.wrap = true

-- Highlight search hits
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Better colors
vim.opt.termguicolors = true

-- Always have 8 columns at bottom
vim.opt.scrolloff = 15
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Fast
vim.opt.updatetime = 50

-- Column at 80 characters
vim.opt.colorcolumn = "80"
vim.lazyredraw = true


vim.loader.disable()

-- do
--     -- register autocommand callacks to cleverly toggle
--     -- relative numbers when scrolling, .. this works
--     -- around the issue with frames dropped in neovide
--     -- when scrolling quickly with relative numbering on
--
--     -- this autocommand turns relative numbering off when we begin to scroll
--     vim.api.nvim_create_autocmd({ "WinScrolled" }, {
--         callback = function(ev)
--             if vim.o.relativenumber then
--                 vim.cmd('set relativenumber norelativenumber')
--             end
--         end
--     })
--
--     -- this autocommand turns relative numberin on when we have idled (stopped scrolling)
--     vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI"}, {
--         callback = function(ev)
--             if not vim.o.relativenumber then
--                 vim.cmd('set relativenumber relativenumber')
--             end
--         end
--     })
-- end
