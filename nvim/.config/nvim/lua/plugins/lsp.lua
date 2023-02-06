-- lsp.lua

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)

    -- Add cmp completion as a capability to lsp.
    server:setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    })
end)

-- Configure and setup Volar
require'lspconfig'.volar.setup{}
