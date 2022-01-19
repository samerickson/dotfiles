local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end

require "paq" {
    "savq/paq-nvim";                        -- Let Paq manage itself
    "Yagua/nebulous.nvim";                  -- Color scheme
    "nvim-treesitter/nvim-treesitter";      -- Better syntax highlighting
    "nvim-treesitter/playground";           -- See treesitter infomration in a buffer
    "nvim-lua/plenary.nvim";                -- Required by telescope
    "nvim-telescope/telescope.nvim";        -- Used for flying around your file tree
    "danymat/neogen";                       -- A better comment generator
    "neovim/nvim-lspconfig";                -- Language server configuration
    "hrsh7th/nvim-compe";                   -- Auto completion
    "williamboman/nvim-lsp-installer";      -- Installs and enables LSP servers
    "b3nj5m1n/kommentary";                  -- Comment plugin
    "goolord/alpha-nvim";                   -- Neovim dashboard written in lua
    "kyazdani42/nvim-web-devicons";         -- Icons
    "ojroques/nvim-hardline";               -- Status line plugin
}

local lsp_server_configuration = {
    ["grammarly"] = function(opts)
        print("HERE")
        opts.filetypes = { "markdown", "tex", "latex" }
    end
}

require('neogen').setup {
    enabled = true
}

require('hardline').setup{}

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
}

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {}

    if lsp_server_configuration[server.name] then
        lsp_server_configuration[server.name](opts)
        print(vim.inspect(opts))
    end
    server:setup(opts)
end)

vim.o.completeopt = "menuone,noselect"require('compe').setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
  };
}

require "nvim-treesitter.configs".setup {
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}
