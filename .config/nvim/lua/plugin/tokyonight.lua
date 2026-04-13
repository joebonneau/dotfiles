vim.pack.add {
  -- 'https://www.github.com/folke/tokyonight.nvim',
  'https://github.com/neanias/everforest-nvim',
}
require('everforest').setup {
  background = 'hard',
}
vim.cmd.colorscheme 'everforest'
-- ---@diagnostic disable-next-line: missing-fields
-- require('tokyonight').setup {
--   styles = {
--     comments = { italic = false },
--     floats = 'transparent',
--     sidebars = 'transparent',
--   },
-- }
-- vim.cmd.colorscheme 'tokyonight-storm'
