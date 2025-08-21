return {
  'nvim-focus/focus.nvim',
  version = false,
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
      '<M-h>',
      function()
        vim.api.nvim_command 'FocusSplitLeft'
        vim.api.nvim_command 'FocusAutoresize'
      end,
      'Switch to (or create) the left buffer and autoresize',
    },
    {
      '<M-l>',
      function()
        vim.api.nvim_command 'FocusSplitRight'
        vim.api.nvim_command 'FocusAutoresize'
      end,
      'Switch to (or create) the right buffer and autoresize',
    },
    {
      '<M-j>',
      function()
        vim.api.nvim_command 'FocusSplitDown'
        vim.api.nvim_command 'FocusAutoresize'
      end,
      'Switch to (or create) the left buffer and autoresize',
    },
    {
      '<M-k>',
      function()
        vim.api.nvim_command 'FocusSplitUp'
        vim.api.nvim_command 'FocusAutoresize'
      end,
      'Switch to (or create) the right buffer and autoresize',
    },
  },
}
