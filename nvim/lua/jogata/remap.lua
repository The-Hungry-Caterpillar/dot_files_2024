-- <leader>fv to exit file and go back to explorer
vim.keymap.set("n", "<leader>fv", vim.cmd.Ex)

-- jk for quick esc to normal mode 
vim.keymap.set("i", "jk", "<Esc>")

-- <leader>w to save changes
vim.keymap.set("n", "<leader>w", vim.cmd.w)

-- move lines in view mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in middle when moving up/down half page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- pipe shortcut for R
vim.keymap.set("i", "jj", "%>%")

-- keep cursor in middle when jumping through search hits
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "n", "nzzzv")

-- -- yank to keyboard
-- vim.keymap.set("n", "<leader>y", "\"+y")
-- vim.keymap.set("n", "<leader>Y", "\"+Y")
-- vim.keymap.set("v", "<leader>y", "\"+y")

-- Create windows easier, tmux-like
vim.keymap.set("n", "w|", "<C-w>v")
vim.keymap.set("n", "w_", "<C-w>s")

-- Move through windows more better
vim.keymap.set("n", "wh", "<C-w>h")
vim.keymap.set("n", "wj", "<C-w>j")
vim.keymap.set("n", "wk", "<C-w>k")
vim.keymap.set("n", "wl", "<C-w>l")

-- Move through buffers more better
vim.keymap.set("n", "<leader>l", ":bnext<CR>", { noremap = true})
vim.keymap.set("n", "<leader>h", ":bprevious<CR>", { noremap = true})
-- <leader>bd to delete buffer but not window
vim.keymap.set("n", "<leader>d", ":<C-U>bprevious <bar> bdelete #<CR>")
-- faster terminal exit
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
