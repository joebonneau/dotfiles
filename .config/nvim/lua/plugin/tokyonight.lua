vim.pack.add {
  'https://www.github.com/folke/tokyonight.nvim',
}
---@diagnostic disable-next-line: missing-fields
require('tokyonight').setup {
  styles = {
    comments = { italic = false },
    floats = 'transparent',
    sidebars = 'transparent',
  },
}
vim.cmd.colorscheme 'tokyonight-storm'
