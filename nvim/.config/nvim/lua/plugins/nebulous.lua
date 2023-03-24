return {
    'samerickson/nebulous.nvim',
    lazy = false,
    priority = 1000,
    config = {
        disable = {
            background = true,
            endOfBuffer = false,
            terminal_colors = true
        },
        italic = {
            comments   = true,
            keywords   = true,
            functions  = false,
            variables  = true
        }
    }
}

