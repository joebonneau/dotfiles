vim.pack.add {
  'https://github.com/esmuellert/codediff.nvim',
}
require('codediff').setup {
  explorer = {
    view_mode = 'tree',
  },
}

vim.api.nvim_create_autocmd('User', {
  pattern = 'CodeDiffOpen',
  callback = function()
    vim.g.codediff_saved_showtabline = vim.o.showtabline
    vim.o.showtabline = 0
    vim.g.focus_disabled = true
    require('focus').focus_disable()
  end,
})
vim.api.nvim_create_autocmd('User', {
  pattern = 'CodeDiffClose',
  callback = function()
    if vim.g.codediff_saved_showtabline then
      vim.o.showtabline = vim.g.codediff_saved_showtabline
      vim.g.codediff_saved_showtabline = nil
      vim.g.focus_disabled = false
      require('focus').focus_enable()
    end
  end,
})
