return {
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = { {'nvim-lua/plenary.nvim'} },
    config = {
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          "x64",
          "coverage"
        },
      },
    }
  },
}
