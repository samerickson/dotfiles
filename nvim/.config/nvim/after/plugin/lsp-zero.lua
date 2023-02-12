local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'sumneko_lua',
    'rust_analyzer'
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.configure('rust_analyzer', {
    checkOnSave = {
        -- default: 'cargo check'
        command = "clippy"
    },
    cargo = {
        allFeatures = true
    },
    inlayHints = {
        lifetimeElisionHints = {
            enabled = true,
            useParameterNames = true
        }
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("", "<F12>", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("", "<F8>", function() vim.lsp.buf.format() end, opts)
    vim.keymap.set("", "<F3>", ': lua vim.lsp.buf.code_action()<cr>', opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>a>", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("", "<S-F12>", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<C-r><C-r>", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-s>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
