local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end

require "paq" {
	"savq/paq-nvim";						-- Let Paq manage itself
	"Yagua/nebulous.nvim";					-- Color scheme
	"nvim-treesitter/nvim-treesitter";		-- Better syntax highlighting
	"nvim-lua/plenary.nvim";				-- Required by telescope
	"nvim-telescope/telescope.nvim";		-- Used for flying around your file tree
	"danymat/neogen";						-- A better comment generator
	"neovim/nvim-lspconfig";
	"hrsh7th/nvim-compe";
	"williamboman/nvim-lsp-installer";
}

require('neogen').setup {
            enabled = true
}

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
	server:setup({})
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
