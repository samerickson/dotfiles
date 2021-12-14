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
	"danymat/neogen"						-- A better comment generator
}

require('neogen').setup {
            enabled = true
}
