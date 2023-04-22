return {
  "folke/which-key.nvim",
  lazy = false,
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup({
      key_labels = {
        ["<leader>"] = "Leader",
        ["<C>"] = "Ctrl",
        ["<CR>"] = "ENTER"
      },
      register = {
        t = {
          name = "Telescope"
        }
      }
    })
  end,
}
