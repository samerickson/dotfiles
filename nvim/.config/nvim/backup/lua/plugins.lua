require "paq" {
    "savq/paq-nvim";                        -- Let Paq manage itself
    "VonHeikemen/lsp-zero.nvim";
    "Yagua/nebulous.nvim";                  -- Color scheme
    "nvim-treesitter/nvim-treesitter";      -- Better syntax highlighting
    "nvim-treesitter/playground";           -- See treesitter infomration in a buffer
    "nvim-lua/plenary.nvim";                -- Required by telescope
    "nvim-telescope/telescope.nvim";        -- Used for flying around your file tree
    "danymat/neogen";                       -- A better comment generator
    "neovim/nvim-lspconfig";                -- Language server configuration
    "williamboman/mason.nvim";
    "williamboman/mason-lspconfig.nvim";
    "hrsh7th/nvim-cmp";                     -- Auto completion
    "hrsh7th/cmp-nvim-lsp";
    "hrsh7th/cmp-buffer";
    "hrsh7th/cmp-path";
    "hrsh7th/cmp-cmdline";
    "hrsh7th/cmp-vsnip";
    "saadparwaiz1/cmp_luasnip";
    "L3MON4D3/LuaSnip";
    "rafamadriz/friendly-snippets";
    "ojroques/nvim-hardline";               -- Status line plugin
    "lukas-reineke/indent-blankline.nvim";
}

-- Include all the configuration files for all plugins
require("plugins/telescope")
require("plugins/treesitter")
require("plugins/cmp")
require("plugins/lsp")
require("plugins/indent-blankline")
require("hardline").setup{}
require("neogen").setup { enabled = true }

-- Allow cmp to use treesitter
local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }, _config or {})
end

