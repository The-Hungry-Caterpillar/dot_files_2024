function ColorMe(color)
   color = color or 'dracula-soft'
    -- vim.opt.background="light"
    vim.cmd.colorscheme(color)
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMe()
