vim.pack.add { 'https://www.github.com/folke/noice.nvim', 'https://www.github.com/MunifTanjim/nui.nvim' }
require('noice').setup {
  cmdline = {
    format = {
      cmdline = { pattern = '^:', icon = '  ', lang = 'vim' },
    },
    view = 'cmdline',
  },
  messages = {
    enabled = true,
  },
  popupmenu = {
    enabled = false,
  },
  presets = {
    bottom_search = true,
  },
  lsp = {
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
    },
    signature = {
      auto_open = {
        enabled = false,
      },
    },
  },
}

vim.keymap.set({ 'i', 'n', 's' }, '<C-f>', function()
  if not require('noice.lsp').scroll(4) then
    return '<c-f>'
  end
end, { silent = true, expr = true, desc = 'Scroll Forward' })

vim.keymap.set({ 'i', 'n', 's' }, '<C-b>', function()
  if not require('noice.lsp').scroll(-4) then
    return '<c-b>'
  end
end, { silent = true, expr = true, desc = 'Scroll Backward' })

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
