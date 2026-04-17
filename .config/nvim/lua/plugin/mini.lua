vim.pack.add {
  'https://www.github.com/nvim-mini/mini.nvim',
  'https://github.com/JoosepAlviste/nvim-ts-context-commentstring',
}

-- icons
require('mini.icons').mock_nvim_web_devicons()

-- ai
require('mini.ai').setup { n_lines = 500 }

-- surround
require('mini.surround').setup {
  mappings = {
    add = 'gza',
    delete = 'gzd',
    replace = 'gzr',
  },
}

-- diff
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

-- snippets
local snippets = require 'mini.snippets'
snippets.setup {
  snippets = {
    snippets.gen_loader.from_lang(),
    snippets.gen_loader.from_file '~/.config/nvim/snippets/global.json',
  },
  mappings = { stop = '<esc>' },
}

-- pairs
require('mini.pairs').setup {}

-- animate
require('mini.animate').setup {
  resize = { enable = false },
}

-- comment
require('mini.comment').setup {
  options = {
    custom_commentstring = function()
      return require('ts_context_commentstring').calculate_commentstring() or vim.bo.commentstring
    end,
  },
}

-- trailspace
require('mini.trailspace').setup()

-- files
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

vim.keymap.set('n', '<leader>e', function()
  if not MiniFiles.close() then
    MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
  end
end, { desc = 'Open mini.files in cwd' })

vim.keymap.set('n', '<leader>E', function()
  if not MiniFiles.close() then
    MiniFiles.open(vim.fn.getcwd(), false)
  end
end, { desc = 'Open mini.files in cwd' })

-- statusline
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

-- hipatterns
local hipatterns = require 'mini.hipatterns'
hipatterns.setup {
  highlighters = {
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
    note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
  },
}

-- bufremove
require('mini.bufremove').setup()

vim.keymap.set('n', '<leader>bd', function()
  MiniBufremove.delete()
end, { desc = 'Buffer delete' })

-- indentscope
require('mini.indentscope').setup {
  symbol = '│',
}
