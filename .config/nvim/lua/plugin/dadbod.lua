vim.pack.add {
  'https://www.github.com/tpope/vim-dadbod',
  'https://www.github.com/kristijanhusak/vim-dadbod-ui',
  'https://www.github.com/kristijanhusak/vim-dadbod-completion',
}
vim.g.db_ui_use_nerd_fonts = 1

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'dbui', 'dbout' },
  callback = function()
    vim.g.codediff_saved_showtabline = vim.o.showtabline
    vim.o.showtabline = 0
    vim.g.focus_disabled = true
    require('focus').focus_disable()
  end,
})
