return {
	"nvim-lualine/lualine.nvim",
	opts = function(_, opts)
		local dark_bg = "#18181a" -- darkvoid’s base
		local fg = "#c7c7c7"

		opts.options.theme = {
			normal = {
				a = { fg = dark_bg, bg = "#7fd4c7", gui = "bold" }, -- mode section
				b = { fg = fg, bg = dark_bg },
				c = { fg = fg, bg = dark_bg }, -- dark middle
			},
			inactive = {
				a = { fg = fg, bg = dark_bg },
				b = { fg = fg, bg = dark_bg },
				c = { fg = fg, bg = dark_bg },
			},
		}

		opts.options.section_separators = { left = "", right = "" }
	end,
}
