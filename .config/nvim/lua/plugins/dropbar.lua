return {
  'Bekaboo/dropbar.nvim',
  enabled = false,
  name = 'dropbar',
  opts = {
    bar = {
      sources = function(buf, _)
        local sources = require 'dropbar.sources'
        return { sources.path }
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
  },
}
