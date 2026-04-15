vim.cmd.packadd 'nvim.undotree'
-- require('vim._core.ui2').enable { msg = { target = 'cmd' } }

vim.keymap.set('n', '<leader>ut', '<cmd>Undotree<cr>', { desc = 'Open undotree', silent = true })

vim.keymap.set({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>bb', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
vim.keymap.set('n', '<leader>wd', '<C-W>c', { desc = 'Delete Window', remap = true })

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

vim.keymap.set('n', '<leader>gd', function()
  vim.cmd 'DiffviewToggle'
end, { desc = 'Toggle git diff view', silent = true })

vim.api.nvim_create_user_command('Restart', function()
  local session = vim.fn.stdpath 'state' .. '/restart_session.vim'
  vim.cmd('mksession! ' .. vim.fn.fnameescape(session))
  vim.cmd('restart source ' .. vim.fn.fnameescape(session))
end, {})

vim.keymap.set('n', '<leader>r', function()
  vim.lsp.buf.rename()
end, { desc = 'Rename via LSP' })
