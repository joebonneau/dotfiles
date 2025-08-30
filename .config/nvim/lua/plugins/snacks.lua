return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    bufdelete = { enabled = true },
    indent = { enabled = true },
    rename = { enabled = true },
    picker = { enabled = true },
  },
  keys = {
    {
      '<leader>su',
      function()
        require('snacks').picker.undo()
      end,
      desc = 'Undo history',
    },
  },
}
