-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<leader>l', '<cmd>Lazy<CR>')
vim.keymap.set('n', '<leader>bb', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
vim.keymap.set('n', '<leader>bd', function()
  require('snacks').bufdelete()
end, { desc = 'Delete Buffer' })
vim.keymap.set('n', '<leader>wd', '<C-W>c', { desc = 'Delete Window', remap = true })
vim.keymap.set('n', '<leader>gd', function()
  require('focus').focus_disable()
  vim.cmd 'DiffviewOpen'
end, { desc = 'Open git diff view', silent = true })
vim.keymap.set('n', '<leader>gD', function()
  require('focus').focus_enable()
  vim.cmd 'DiffviewClose'
end, { desc = 'Close git diff view', silent = true })

vim.keymap.set('n', '<leader>o', 'o<Esc>')
vim.keymap.set('n', '<leader>O', 'O<Esc>')
vim.keymap.set('n', '<leader>uf', function()
  local enabled = vim.b.autoformat
  if enabled == nil or not enabled then
    vim.b.autoformat = true
  else
    vim.b.autoformat = false
  end
end)

vim.api.nvim_create_user_command('W', function()
  vim.api.nvim_cmd({ cmd = 'w' }, {})
end, {})

vim.api.nvim_create_user_command('Wq', function()
  vim.api.nvim_cmd({ cmd = 'wq' }, {})
end, {})

-- macros
vim.keymap.set('n', 'Q', '@qj', { remap = true })
vim.keymap.set('x', 'Q', ':norm @qj<CR>')

-- Duplicate a line and comment out the first line
vim.keymap.set('n', 'yc', 'yygccp', { remap = true })
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- vim: ts=2 sts=2 sw=2 et
