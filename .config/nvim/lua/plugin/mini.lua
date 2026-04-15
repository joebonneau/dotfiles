vim.pack.add {
  'https://www.github.com/nvim-mini/mini.nvim',
  'https://github.com/JoosepAlviste/nvim-ts-context-commentstring',
}

require('mini.icons').mock_nvim_web_devicons()

require('mini.ai').setup { n_lines = 500 }

require('mini.surround').setup {
  mappings = {
    add = 'gza',
    delete = 'gzd',
    replace = 'gzr',
  },
}

require('mini.diff').setup {
  view = {
    style = 'sign',
    signs = {
      add = '+',
      change = '~',
      delete = '-',
      topdelete = '',
      changedelete = '▎',
      untracked = '+',
    },
    priority = 199,
  },
}

local snippets = require 'mini.snippets'
snippets.setup {
  snippets = {
    snippets.gen_loader.from_lang(),
    snippets.gen_loader.from_file '~/.config/nvim/snippets/global.json',
  },
  mappings = { stop = '<esc>' },
}

require('mini.pairs').setup {
  modes = { insert = true, command = true, terminal = false },
  mappings = {
    -- autopair if after "function" or surrounded by blankspace, but not if before "error"
    ['('] = { action = 'open', pair = '()', neigh_pattern = '[%w%s][^%w%)]' },
    ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\].' },
    ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\].' },

    [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
    [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
    ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },

    ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '[^\\].', register = { cr = false } },
    ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '[^%a\\].', register = { cr = false } },
    ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '[^\\].', register = { cr = false } },
  },
}

require('mini.animate').setup {
  resize = { enable = false },
}

require('mini.comment').setup {
  options = {
    custom_commentstring = function()
      return require('ts_context_commentstring').calculate_commentstring() or vim.bo.commentstring
    end,
  },
}

require('mini.cursorword').setup()

require('mini.trailspace').setup()

require('mini.files').setup {
  mappings = {
    close = 'q',
    go_in = '',
    go_in_plus = '<C-CR>',
    go_out = '<BS>',
    go_out_plus = '<C-BS>',
    reset = '<C-r>',
  },
}

vim.api.nvim_set_hl(0, 'StatuslineDiagError', { fg = 0xf7768e, bg = 0x2E383C })
vim.api.nvim_set_hl(0, 'StatuslineDiagWarn', { fg = 0xe0af68, bg = 0x2E383C })
vim.api.nvim_set_hl(0, 'StatuslineDiagInfo', { fg = 0x0db9d7, bg = 0x2E383C })
vim.api.nvim_set_hl(0, 'StatuslineDiagHint', { fg = 0x1abc9c, bg = 0x2E383C })
vim.api.nvim_set_hl(0, 'StatuslineMacro', { fg = 0xff9e64, bg = 0x2E383C })

local function diagnostics_section()
  local diag_icons = {
    Error = ' ',
    Warn = ' ',
    Info = ' ',
    Hint = ' ',
  }
  local d = vim.diagnostic.get(0)
  if vim.tbl_isempty(d) then
    return ''
  end

  local counts = { ERROR = 0, WARN = 0, INFO = 0, HINT = 0 }
  for _, diag in ipairs(d) do
    local sev = vim.diagnostic.severity[diag.severity]
    if sev and counts[sev] then
      counts[sev] = counts[sev] + 1
    end
  end

  local parts = {}
  local map = {
    { key = 'ERROR', icon = diag_icons.Error, hl = 'StatuslineDiagError' },
    { key = 'WARN', icon = diag_icons.Warn, hl = 'StatuslineDiagWarn' },
    { key = 'INFO', icon = diag_icons.Info, hl = 'StatuslineDiagInfo' },
    { key = 'HINT', icon = diag_icons.Hint, hl = 'StatuslineDiagHint' },
  }
  for _, entry in ipairs(map) do
    if counts[entry.key] > 0 then
      table.insert(parts, ('%%#%s#%s%d'):format(entry.hl, entry.icon, counts[entry.key]))
    end
  end

  return table.concat(parts, ' ') .. '%#MiniStatuslineDevinfo#'
end
require('mini.statusline').setup {
  content = {
    active = function()
      local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }

      local diagnostics = diagnostics_section()
      local recording_register = vim.fn.reg_recording()
      local macro = recording_register ~= '' and ('recording @' .. recording_register) or ''

      local function location()
        local line = vim.fn.line '.'
        local total = vim.fn.line '$'
        local col = vim.fn.virtcol '.'
        local percent = math.floor(line / total * 100)
        return percent .. '%%' .. ' | ' .. line .. ', ' .. col
      end

      return MiniStatusline.combine_groups {
        { hl = mode_hl, strings = { mode:upper() } },
        { hl = 'MiniStatuslineDevinfo', strings = { diagnostics } },
        '%<',
        '%=',
        { hl = 'StatuslineMacro', strings = { macro } },
        { hl = mode_hl, strings = { location() } },
      }
    end,
  },
  use_icons = true,
}

require('mini.misc').setup()

local hipatterns = require 'mini.hipatterns'
hipatterns.setup {
  highlighters = {
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
    note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
}

require('mini.bufremove').setup()

require('mini.indentscope').setup {
  symbol = '│',
}

vim.keymap.set('n', '<leader>bd', function()
  MiniBufremove.delete()
end, { desc = 'Buffer delete' })

vim.keymap.set('n', '<leader>e', function()
  if not MiniFiles.close() then
    MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
  end
end, { desc = 'Open mini.files in cwd' })

vim.keymap.set('n', '<leader>E', function()
  if not MiniFiles.close() then
    MiniFiles.open(nil, false)
  end
end, { desc = 'Open mini.files in root' })
