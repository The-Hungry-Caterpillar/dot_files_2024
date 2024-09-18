function ColorMe(color)
    -- color = color or "tokyonight-moon"
    -- color = color or "dracula"
    color = color or "sonokai"
    -- color = color or "darkvoid"
    -- color = color or "catppuccin-latte"
    -- color = color or "catppuccin-macchiato"
    -- color = color or "onedark"
    -- color = color or "gruvbox-material"
    -- color = color or "solarized-osaka-storm"
    -- color = color or "solarized-osaka-day"
    -- color = color or "melange"
    -- vim.opt.background="light"
    vim.cmd.colorscheme(color)
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMe()
