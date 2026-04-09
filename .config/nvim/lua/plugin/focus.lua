vim.pack.add { 'https://www.github.com/nvim-focus/focus.nvim' }
require('focus').setup()

vim.keymap.set('n', '<leader>z', '<cmd>FocusMaxOrEqual<CR>', { desc = 'Zoom into the current buffer' })

local function split_nav(focus_cmd, fallback)
  return function()
    if vim.g.focus_disabled then
      vim.cmd('wincmd ' .. fallback)
    else
      vim.cmd('Focus' .. focus_cmd)
      vim.cmd 'FocusAutoresize'
    end
  end
end

vim.keymap.set('n', '<C-h>', split_nav('SplitLeft', 'h'), { desc = 'Switch to left buffer' })
vim.keymap.set('n', '<C-l>', split_nav('SplitRight', 'l'), { desc = 'Switch to right buffer' })
vim.keymap.set('n', '<C-j>', split_nav('SplitDown', 'j'), { desc = 'Switch to bottom buffer' })
vim.keymap.set('n', '<C-k>', split_nav('SplitUp', 'k'), { desc = 'Switch to top buffer' })
