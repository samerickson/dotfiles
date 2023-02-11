-- colors.lua

-- Load in color scheme setup
require("nebulous").setup {
    variant = "midnight",
    disable = {
        terminal_colors = true,
        background = true,
        endOfBuffer = false,
    },
    italic = {
        comments   = false,
        keywords   = true,
        functions  = false,
        variables  = true,
    },
}

