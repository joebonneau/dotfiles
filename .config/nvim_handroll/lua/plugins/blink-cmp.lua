return {
  'saghen/blink.cmp',
  version = '1.*',
  dependencies = { 'fang2hou/blink-copilot' },
  opts = {
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
      default = { 'buffer', 'lsp', 'path', 'snippets', 'copilot' },
      per_filetype = { sql = { 'snippets', 'buffer', 'dadbod' } },
      providers = {
        dadbod = {
          name = 'Dadbod',
          module = 'vim_dadbod_completion.blink',
        },
        copilot = {
          name = 'copilot',
          module = 'blink-copilot',
          score_offset = 100,
          async = true,
        },
      },
    },
    cmdline = {
      sources = { 'buffer', 'cmdline' },
    },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
  },
}
