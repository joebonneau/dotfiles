vim.pack.add { 'https://www.github.com/folke/noice.nvim', 'https://www.github.com/MunifTanjim/nui.nvim' }
require('noice').setup {
  cmdline = {
    format = {
      cmdline = { pattern = '^:', icon = ' $ ', lang = 'vim' },
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
    long_message_to_split = true,
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
  routes = {
    {
      filter = {
        event = 'msg_show',
        any = {
          { find = '%d+L, %d+B' },
          { find = '; after #%d+' },
          { find = '; before #%d+' },
        },
      },
      view = 'mini',
    },
    {
      filter = { event = 'msg_show', kind = 'emsg', find = 'E486' },
      opts = { skip = true },
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
