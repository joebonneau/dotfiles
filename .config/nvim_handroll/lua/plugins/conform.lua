return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre', 'BufNewFile' },
  cmd = { 'ConformInfo' },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 500,
          lsp_format = 'fallback',
        }
      end
    end,
    formatters_by_ft = {
      javascript = { 'prettierd' },
      typescript = { 'prettierd' },
      javascriptreact = { 'prettierd' },
      typescriptreact = { 'prettierd' },
      css = { 'prettierd', 'stylelint' },
      html = { 'prettierd' },
      json = { 'prettierd' },
      yaml = { 'prettierd' },
      markdown = { 'prettierd' },
      graphql = { 'prettierd' },
      lua = { 'stylua' },
      python = { 'ruff_format', 'ruff_organize_imports', 'ruff_fix' },
      go = { 'gofumpt', 'goimports', 'golines' },
      fish = { 'fish_indent' },
      bash = { 'shfmt' },
      htmldjango = { 'djlint' },
      rust = { 'rustfmt' },
      sql = { 'sleek' },
      terraform = { 'terraform_fmt' },
    },
  },
}
