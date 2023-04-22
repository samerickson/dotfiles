return {
  {
    'samerickson/nebulous.nvim',
    lazy = false,
    priority = 1000,
    opts = {
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
  },
  --[[ {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    opts = {
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true,
      show_end_of_buffer = false, -- show the '~' characters after the end of buffers
      term_colors = false,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = {},
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
      },
    }
  }, ]]
}

