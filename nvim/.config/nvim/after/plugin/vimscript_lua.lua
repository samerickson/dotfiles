local embedded_vimscript = vim.treesitter.parse_query(
    "lua",
    [[(function_call
        (dot_index_expression
            field: (identifier) @field (#eq? @field "nvim_exec"))) @testing
        (arguments (string)) @vimscript
]]
)

local get_root = function (bufnr)
    local parser = vim.treesitter.get_parser(bufnr, "lua", {})
    local tree = parser:parse()[1]
    return tree:root()
end


local format_dat_sql = function (bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()

    if vim.bo[bufnr].filetype ~= "lua" then
        vim.notify "Can only be used in lua"
        return
    end
end

local root = get_root(bufnr)
local changes = {}


