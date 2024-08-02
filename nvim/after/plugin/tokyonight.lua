require("tokyonight").setup({
    -- use the night style
    style = "night",
    -- disable italic for functions
    styles = {
        functions = {}
    },
    on_colors = function(colors)
        colors.hint = colors.orange
        colors.error = "#ff0000"
    end
})
