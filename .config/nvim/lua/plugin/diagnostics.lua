vim.diagnostic.config {
  virtual_lines = false,
  -- virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
      [vim.diagnostic.severity.WARN] = 'WarningMsg',
    },
  },
}

vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
  once = true,
  callback = function()
    vim.pack.add { 'https://www.github.com/mfussenegger/nvim-lint' }
    require('lint').linters_by_ft = {
      javascript = { 'eslint_d' },
      typescript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
      djangohtml = { 'djlint' },
      gha_yaml = { 'actionlint' },
      dockerfile = { 'hadolint' },
      css = { 'stylelint' },
    }
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
})

local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go { severity = severity }
  end
end
vim.keymap.set('n', ']d', diagnostic_goto(true), { desc = 'Next Diagnostic' })
vim.keymap.set('n', '[d', diagnostic_goto(false), { desc = 'Prev Diagnostic' })

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
