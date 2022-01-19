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
    "hrsh7th/nvim-cmp";                     -- Auto completion
    "hrsh7th/cmp-nvim-lsp";
    "hrsh7th/cmp-buffer";
    "hrsh7th/cmp-path";
    "hrsh7th/cmp-cmdline";
    "hrsh7th/cmp-vsnip";
    "hrsh7th/vim-vsnip";
    "williamboman/nvim-lsp-installer";      -- Installs and enables LSP servers
    "b3nj5m1n/kommentary";                  -- Comment plugin
    "goolord/alpha-nvim";                   -- Neovim dashboard written in lua
    "kyazdani42/nvim-web-devicons";         -- Icons
    "ojroques/nvim-hardline";               -- Status line plugin
}

local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }, _config or {})
end

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
    local opts = config()

    if lsp_server_configuration[server.name] then
        lsp_server_configuration[server.name](opts)
        print(vim.inspect(opts))
    end
    server:setup(opts)
end)

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
