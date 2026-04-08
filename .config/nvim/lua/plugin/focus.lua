vim.pack.add { 'https://www.github.com/nvim-focus/focus.nvim' }
require('focus').setup()

vim.keymap.set('n', '<leader>z', '<cmd>FocusMaxOrEqual<CR>', { desc = 'Zoom into the current buffer' })

vim.keymap.set('n', '<C-h>', function()
  vim.api.nvim_command 'FocusSplitLeft'
  vim.api.nvim_command 'FocusAutoresize'
end, { desc = 'Switch to (or create) the left buffer and autoresize' })

vim.keymap.set('n', '<C-l>', function()
  vim.api.nvim_command 'FocusSplitRight'
  vim.api.nvim_command 'FocusAutoresize'
end, { desc = 'Switch to (or create) the right buffer and autoresize' })

vim.keymap.set('n', '<C-j>', function()
  vim.api.nvim_command 'FocusSplitDown'
  vim.api.nvim_command 'FocusAutoresize'
end, { desc = 'Switch to (or create) the left buffer and autoresize' })

vim.keymap.set('n', '<C-k>', function()
  vim.api.nvim_command 'FocusSplitUp'
  vim.api.nvim_command 'FocusAutoresize'
end, { desc = 'Switch to (or create) the right buffer and autoresize' })
