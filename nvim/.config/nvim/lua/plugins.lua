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

local cmp = require'cmp'

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
