vim.pack.add {
  {
    src = 'https://www.github.com/saghen/blink.cmp',
    version = vim.version.range '1.*',
  },
  -- {
  --   src = 'https://www.github.com/fang2hou/blink-copilot',
  -- },
}
-- require('blink-copilot').setup {}
require('blink.cmp').setup {
  keymap = {
    ['<C-j>'] = { 'select_next', 'fallback' },
    ['<C-k>'] = { 'select_prev', 'fallback' },
    ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
    ['<CR>'] = { 'accept', 'fallback' },
    ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
  },
  completion = {
    list = {
      selection = { preselect = false, auto_insert = false },
      cycle = { from_bottom = true, from_top = true },
    },
  },
  snippets = { preset = 'mini_snippets' },
  sources = {
    -- default = { 'buffer', 'lsp', 'path', 'snippets', 'copilot' },
    default = { 'buffer', 'lsp', 'path', 'snippets' },
    per_filetype = { sql = { 'snippets', 'buffer', 'dadbod', 'tabpage' } },
    providers = {
      buffer = {
        opts = {
          get_bufnrs = function()
            return { vim.api.nvim_get_current_buf() }
          end,
        },
      },
      dadbod = {
        name = 'Dadbod',
        module = 'vim_dadbod_completion.blink',
      },
      tabpage = {
        name = 'Tabpage',
        module = 'plugin.blink_tabpage',
        score_offset = -3,
      },
      -- copilot = {
      --   name = 'copilot',
      --   module = 'blink-copilot',
      --   score_offset = 100,
      --   async = true,
      -- },
    },
  },
  cmdline = {
    sources = { 'buffer', 'cmdline' },
  },
  fuzzy = { implementation = 'prefer_rust_with_warning' },
}

-- vim.api.nvim_create_autocmd({ 'BufWritePre', 'BufNewFile' }, {
--   once = true,
--   callback = function()
--     vim.pack.add { 'https://www.github.com/zbirenbaum/copilot.lua' }
--     require('copilot').setup {
--       suggestion = { enabled = false },
--       panel = { enabled = false },
--       filetypes = {
--         markdown = true,
--         help = true,
--       },
--     }
--   end,
-- })
