return {
  'folke/noice.nvim',
  enabled = true,
  opts = {
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
      signature = {
        auto_open = {
          enabled = false,
        },
      },
    },
  },
  keys = {
    {
      '<C-f>',
      function()
        if not require('noice.lsp').scroll(4) then
          return '<c-f>'
        end
      end,
      silent = true,
      expr = true,
      desc = 'Scroll Forward',
      mode = { 'i', 'n', 's' },
    },
    {
      '<C-b>',
      function()
        if not require('noice.lsp').scroll(-4) then
          return '<c-b>'
        end
      end,
      silent = true,
      expr = true,
      desc = 'Scroll Backward',
      mode = { 'i', 'n', 's' },
    },
  },
}
