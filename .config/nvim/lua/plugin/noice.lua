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

-- vim.pack.add { 'https://github.com/rachartier/tiny-cmdline.nvim' }
-- require('tiny-cmdline').setup {
--   position = {
--     x = 0.5,
--     y = 0.9,
--   },
-- }
-- require('vim._core.ui2').enable {
--   enable = true,
--   msg = {
--     targets = {
--       [''] = 'msg',
--       empty = 'cmd',
--       bufwrite = 'msg',
--       confirm = 'cmd',
--       emsg = 'msg',
--       echo = 'msg',
--       echomsg = 'msg',
--       echoerr = 'msg',
--       completion = 'cmd',
--       list_cmd = 'pager',
--       lua_error = 'msg',
--       lua_print = 'msg',
--       progress = 'pager',
--       rpc_error = 'pager',
--       quickfix = 'msg',
--       search_cmd = 'cmd',
--       search_count = 'cmd',
--       shell_cmd = 'pager',
--       shell_err = 'pager',
--       shell_out = 'pager',
--       shell_ret = 'msg',
--       undo = 'msg',
--       verbose = 'pager',
--       wildlist = 'cmd',
--       wmsg = 'msg',
--       typed_cmd = 'cmd',
--     },
--     cmd = {
--       height = 0.5,
--     },
--     dialog = {
--       height = 0.5,
--     },
--     msg = {
--       height = 0.3,
--       timeout = 5000,
--     },
--     pager = {
--       height = 0.5,
--     },
--   },
-- }
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'msg',
--   callback = function()
--     local ui2 = require 'vim._core.ui2'
--     local win = ui2.wins and ui2.wins.msg
--     if win and vim.api.nvim_win_is_valid(win) then
--       vim.api.nvim_set_option_value('winhighlight', 'Normal:NormalFloat,FloatBorder:FloatBorder', { scope = 'local', win = win })
--     end
--   end,
-- })
--
-- local ui2 = require 'vim._core.ui2'
-- local msgs = require 'vim._core.ui2.messages'
-- local orig_set_pos = msgs.set_pos
-- local setting_pos = false
-- msgs.set_pos = function(tgt)
--   if setting_pos then
--     return
--   end
--   setting_pos = true
--   orig_set_pos(tgt)
--   local columns = vim.o.columns
--   local lines = vim.o.lines
--   local cmdheight = vim.o.cmdheight
--   vim.schedule(function()
--     for _, target in ipairs { 'msg', 'cmd' } do
--       local win = ui2.wins[target]
--       if win and vim.api.nvim_win_is_valid(win) then
--         vim.api.nvim_win_set_config(win, {
--           relative = 'editor',
--           anchor = 'SE',
--           row = lines - cmdheight - 1,
--           col = columns,
--           width = math.floor(vim.o.columns * 0.4),
--           border = 'none',
--         })
--         local f = io.open('/tmp/ui2.log', 'a')
--         f:write(target .. ': ' .. vim.inspect(vim.api.nvim_win_get_config(win)) .. '\n')
--         f:close()
--       end
--     end
--     setting_pos = false
--   end)
-- end
--
