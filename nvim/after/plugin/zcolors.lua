function ColorMe(color)
    -- color = color or "tokyonight-moon"
    color = color or "nord"
    -- color = color or "dracula"
    -- color = color or "gruvbox-material"
    -- color = color or "solarized"
    -- color = color or "solarized-osaka-storm"
    -- vim.opt.background="light"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMe()
