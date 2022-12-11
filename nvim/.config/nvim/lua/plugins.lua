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

-- Include all the configuration files for all plugins
require("plugins/telescope")
require("plugins/treesitter")
require("plugins/cmp")
require("plugins/lsp")
require("hardline").setup{}
require("neogen").setup { enabled = true }

-- Allow cmp to use treesitter
local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }, _config or {})
end

