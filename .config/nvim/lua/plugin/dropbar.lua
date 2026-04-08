vim.pack.add { 'https://www.github.com/Bekaboo/dropbar.nvim' }
require('dropbar').setup {
  bar = {
    sources = function()
      local sources = require 'dropbar.sources'
      return { sources.path }
    end,
    enable = function(buf, win)
      if not buf or not win then
        return false
      end
      if not vim.api.nvim_buf_is_valid(buf) then
        return false
      end
      if not vim.api.nvim_win_is_valid(win) then
        return false
      end
      return vim.bo[buf].buftype == '' and vim.api.nvim_buf_get_name(buf) ~= ''
    end,
  },
  icons = {
    kinds = {
      dir_icon = function()
        return nil, nil
      end,
    },
  },
  sources = {
    path = {
      max_depth = 5,
      preview = false,
      modified = function(sym)
        return sym:merge {
          name = sym.name,
          icon = ' ',
          name_hl = 'MiniIconsYellow',
          icon_hl = 'MiniIconsYellow',
        }
      end,
    },
  },
  symbol = {
    on_click = function() end,
  },
}
