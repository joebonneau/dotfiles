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
  on_highlights = function(hl, c)
    hl.StatuslineMacro = { fg = c.orange, bg = c.bg_statusline }
  end,
}
vim.cmd.colorscheme 'tokyonight-storm'
