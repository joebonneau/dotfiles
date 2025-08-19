return {
  'nvim-focus/focus.nvim',
  version = '*',
  config = function()
    require('focus').setup()
  end,
  keys = {
    {
      '<leader>z',
      '<cmd>FocusMaxOrEqual<CR>',
      'Zoom into the current buffer',
    },
    {
      '<C-h>',
      '<cmd>FocusSplitLeft<CR>',
    },
    {
      '<C-l>',
      '<cmd>FocusSplitRight<CR>',
    },
  },
}
