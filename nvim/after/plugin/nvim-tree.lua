require("nvim-tree").setup({

    view = {
        width = 35,
        relativenumber = true,
    },

    renderer = {

        indent_markers = {
            enable = true,
        },

        icons = {
            glyphs = {
                folder = {
                    arrow_closed = "-",
                    arrow_open = "+",
                },
            },
        },
    },

    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
            quit_on_open = true
        },
    },

    filters = {
        custom = { '.DS_Store' }
    },

    git = {
        ignore = false,
    },

})

local keymap = vim.keymap
keymap.set('n', '<leader>nn', '<cmd>NvimTreeToggle<CR>')
keymap.set('n', '<leader>nf', '<cmd>NvimTreeFindFileToggle<CR>')
keymap.set('n', '<leader>nc', '<cmd>NvimTreeCollapse<CR>')
keymap.set('n', '<leader>nr', '<cmd>NvimTreeRefresh<CR>')
