-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

vim.keymap.set({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<leader>l', '<cmd>Lazy<CR>')
vim.keymap.set('n', '<leader>bb', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
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

vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

vim.api.nvim_create_user_command('FormatDisable', function()
  vim.g.disable_autoformat = true
end, {
  desc = 'Disable autoformat-on-save',
})
vim.api.nvim_create_user_command('FormatEnable', function()
  vim.g.disable_autoformat = false
end, {
  desc = 'Re-enable autoformat-on-save',
})

vim.keymap.set('n', '<leader>uf', function()
  if vim.g.disable_autoformat then
    vim.cmd 'FormatEnable'
    vim.notify 'auto-format on save enabled'
  else
    vim.cmd 'FormatDisable'
    vim.notify 'auto-format on save disabled'
  end
end, { desc = 'Toggle autoformat on save' })

local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go { severity = severity }
  end
end
vim.keymap.set('n', ']d', diagnostic_goto(true), { desc = 'Next Diagnostic' })
vim.keymap.set('n', '[d', diagnostic_goto(false), { desc = 'Prev Diagnostic' })

-- vim: ts=2 sts=2 sw=2 et
