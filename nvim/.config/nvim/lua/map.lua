-- map.lua

-- Map method to handle the different kinds of key maps
return {
	map = function(mode, combo, mapping, opts) 
		local options = {noremap = true}
		if opts then 
			options = vim.tbl_extend('force', options, opts)
		end
		vim.api.nvim_set_keymap(mode, combo, mapping, options)
	end
}

