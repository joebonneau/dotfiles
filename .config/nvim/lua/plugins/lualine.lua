return {
  'nvim-lualine/lualine.nvim',
  opts = function()
    local icons = {
      diagnostics = {
        Error = ' ',
        Warn = ' ',
        Info = ' ',
        Hint = ' ',
      },
    }

    local function fg(name)
      local hl = vim.api.nvim_get_hl(0, { name = name })
      if hl and hl.fg then
        return { fg = string.format('#%06x', hl.fg) }
      end
    end

    vim.o.laststatus = 3

    return {
      options = {
        theme = 'tokyonight',
        globalstatus = true,
        disabled_filetypes = {},
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { { 'mode' } },
        lualine_b = { { 'filename', path = 1 } },
        lualine_c = {
          {
            'diagnostics',
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
        },
        lualine_x = {
          {
            require('noice').api.status.mode.get,
            cond = require('noice').api.status.mode.has,
            color = { fg = '#ff9e64' },
          },
          {
            require('noice').api.status.command.get,
            cond = function()
              return package.loaded['noice'] and require('noice').api.status.command.has()
            end,
            color = fg 'Statement',
          },
        },
        lualine_y = {
          { 'progress', separator = ' ', padding = { left = 1, right = 0 } },
          { 'location', padding = { left = 0, right = 1 } },
        },
        lualine_z = {},
      },
      extensions = { 'lazy', 'mason', 'oil' },
    }
  end,
}
