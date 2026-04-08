vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  once = true,
  callback = function(args)
    vim.pack.add { 'https://www.github.com/stevearc/conform.nvim' }
    require('conform').setup {
      notify_on_error = true,
      format_on_save = function(bufnr)
        if vim.b[bufnr].autoformat == false then
          return nil
        end
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
        toml = { 'taplo' },
        markdown = { 'prettierd' },
        graphql = { 'prettierd' },
        lua = { 'stylua' },
        go = { 'gofumpt', 'goimports', 'golines' },
        fish = { 'fish_indent' },
        bash = { 'shfmt' },
        sql = { 'pg_format' },
        terraform = { 'terraform_fmt' },
      },
    }

    -- Manually trigger format for this first save, since format_on_save
    -- wasn't registered when BufWritePre fired.
    local bufnr = args.buf
    if vim.b[bufnr].autoformat == false then
      return nil
    end
    local disable_filetypes = { c = true, cpp = true }
    if not disable_filetypes[vim.bo[bufnr].filetype] then
      require('conform').format { timeout_ms = 500, lsp_format = 'fallback', buf = bufnr }
    end
  end,
})

vim.keymap.set('n', '<leader>uf', function()
  if vim.b.autoformat == false then
    vim.b.autoformat = nil -- reset to default (enabled)
    vim.notify('autoformatting enabled for buffer', vim.log.levels.INFO)
  else
    vim.b.autoformat = false
    vim.notify('autoformatting disabled for buffer', vim.log.levels.INFO)
  end
end)

vim.api.nvim_create_autocmd('BufEnter', {
  callback = function(args)
    vim.b[args.buf].autoformat = true
  end,
})
