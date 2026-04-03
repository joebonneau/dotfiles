vim.lsp.document_color.enable(true, nil, { style = 'virtual' })
-- require('vim._core.ui2').enable { msg = { target = 'cmd' } }

-- tokyonight

vim.pack.add {
  'https://www.github.com/folke/tokyonight.nvim',
}
---@diagnostic disable-next-line: missing-fields
require('tokyonight').setup {
  styles = {
    comments = { italic = false },
    floats = 'transparent',
    sidebars = 'transparent',
  },
}
vim.cmd.colorscheme 'tokyonight-storm'

-- fzf-lua

vim.pack.add { 'https://www.github.com/ibhagwan/fzf-lua' }
require('fzf-lua').setup {
  previewers = {
    builtin = {
      syntax_limit_b = 1024 * 100,
    },
  },
  grep = {
    rg_glob = true,
    glob_flag = '--iglob',
    glob_separator = '%s%-%-',
  },
  keymap = {
    fzf = {
      ['ctrl-q'] = 'select-all+accept',
      ['ctrl-u'] = 'half-page-up',
      ['ctrl-d'] = 'half-page-down',
    },
  },
}

vim.keymap.set('n', '<leader>ff', function()
  local height = math.floor(0.618 * vim.o.lines)
  local width = math.floor(0.618 * vim.o.columns)
  FzfLua.combine {
    pickers = 'buffers;git_diff;files',
    winopts = {
      height = height,
      width = width,
      row = math.floor(0.5 * (vim.o.lines - height)),
      col = math.floor(0.5 * (vim.o.columns - width)),
      preview = {
        hidden = true,
      },
    },
  }
end, { desc = 'Find files' })

vim.keymap.set('n', '<leader>sg', '<cmd>FzfLua live_grep<cr>', { desc = 'Grep (Root Dir)' })

-- mini.nvim

vim.pack.add {
  'https://www.github.com/nvim-mini/mini.nvim',
}
local icons = require 'mini.icons'
icons.mock_nvim_web_devicons()

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

local gen_loader = require('mini.snippets').gen_loader
require('mini.snippets').setup {
  snippets = {
    gen_loader.from_lang(),
    gen_loader.from_file '~/.config/nvim/snippets/global.json',
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
require('mini.comment').setup()
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
require('mini.sessions').setup()
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

-- blink

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
    default = { 'buffer', 'lsp', 'path', 'snippets', 'copilot' },
    per_filetype = { sql = { 'snippets', 'buffer', 'dadbod' } },
    providers = {
      dadbod = {
        name = 'Dadbod',
        module = 'vim_dadbod_completion.blink',
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

-- conform

vim.api.nvim_create_autocmd({ 'BufWritePre', 'BufNewFile' }, {
  once = true,
  callback = function()
    vim.pack.add { 'https://www.github.com/stevearc/conform.nvim' }
    require('conform').setup {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        javascript = { 'prettierd' },
        typescript = { 'prettierd' },
        javascriptreact = { 'prettierd' },
        typescriptreact = { 'prettierd' },
        css = { 'prettierd', 'stylelint' },
        html = { 'prettierd' },
        json = { 'prettierd' },
        yaml = { 'prettierd' },
        toml = { 'taplo' },
        markdown = { 'prettierd' },
        graphql = { 'prettierd' },
        lua = { 'stylua' },
        go = { 'gofumpt', 'goimports', 'golines' },
        fish = { 'fish_indent' },
        bash = { 'shfmt' },
        htmldjango = { 'djlint' },
        rust = { 'rustfmt' },
        sql = { 'pg_format' },
        terraform = { 'terraform_fmt' },
      },
    }
  end,
})

-- copilot

vim.api.nvim_create_autocmd({ 'BufWritePre', 'BufNewFile' }, {
  once = true,
  callback = function()
    vim.pack.add { 'https://www.github.com/zbirenbaum/copilot.lua' }
    require('copilot').setup {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    }
  end,
})

-- dropbar

vim.pack.add { 'https://www.github.com/Bekaboo/dropbar.nvim' }
require('dropbar').setup {
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
}

-- flit

-- vim.pack.add { 'https://www.github.com/ggandor/flit.nvim' }
-- require('flit').setup { labeled_modes = 'nx' }

-- focus

vim.pack.add { 'https://www.github.com/nvim-focus/focus.nvim' }
require('focus').setup()

vim.keymap.set('n', '<leader>z', '<cmd>FocusMaxOrEqual<CR>', { desc = 'Zoom into the current buffer' })

vim.keymap.set('n', '<C-h>', function()
  vim.api.nvim_command 'FocusSplitLeft'
  vim.api.nvim_command 'FocusAutoresize'
end, { desc = 'Switch to (or create) the left buffer and autoresize' })

vim.keymap.set('n', '<C-l>', function()
  vim.api.nvim_command 'FocusSplitRight'
  vim.api.nvim_command 'FocusAutoresize'
end, { desc = 'Switch to (or create) the right buffer and autoresize' })

vim.keymap.set('n', '<C-j>', function()
  vim.api.nvim_command 'FocusSplitDown'
  vim.api.nvim_command 'FocusAutoresize'
end, { desc = 'Switch to (or create) the left buffer and autoresize' })

vim.keymap.set('n', '<C-k>', function()
  vim.api.nvim_command 'FocusSplitUp'
  vim.api.nvim_command 'FocusAutoresize'
end, { desc = 'Switch to (or create) the right buffer and autoresize' })

-- leap
vim.pack.add { 'https://codeberg.org/andyg/leap.nvim' }
require('leap').setup {}

-- nvim-lint

vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
  once = true,
  callback = function()
    vim.pack.add { 'https://www.github.com/mfussenegger/nvim-lint' }
    require('lint').linters_by_ft = {
      javascript = { 'eslint_d' },
      typescript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
      djangohtml = { 'djlint' },
      gha_yaml = { 'actionlint' },
      dockerfile = { 'hadolint' },
      css = { 'stylelint' },
    }
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
})

-- noice

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
  },
  lsp = {
    signature = {
      auto_open = {
        enabled = false,
      },
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

-- lualine

vim.pack.add {
  'nvim-lualine/lualine.nvim',
}

local lualine_icons = {
  Error = ' ',
  Warn = ' ',
  Info = ' ',
  Hint = ' ',
}

local function fg(name)
  local hl = vim.api.nvim_get_hl(0, { name = name })
  if hl and hl.fg then
    return { fg = string.format('#%06x', hl.fg) }
  end
end

vim.o.laststatus = 3

require('lualine').setup {
  options = {
    theme = 'tokyonight',
    globalstatus = true,
    disabled_filetypes = {},
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { { 'mode' } },
    lualine_b = {},
    lualine_c = {
      {
        'diagnostics',
        symbols = {
          error = lualine_icons.Error,
          warn = lualine_icons.Warn,
          info = lualine_icons.Info,
          hint = lualine_icons.Hint,
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
}

-- nvim-ts-autotag

vim.pack.add { 'https://www.github.com/windwp/nvim-ts-autotag' }
require('nvim-ts-autotag').setup()

-- dadbod
vim.pack.add {
  'https://www.github.com/tpope/vim-dadbod',
  'https://www.github.com/kristijanhusak/vim-dadbod-ui',
  'https://www.github.com/kristijanhusak/vim-dadbod-completion',
}
vim.g.db_ui_use_nerd_fonts = 1

-- nvim-treesitter
vim.pack.add { 'https://www.github.com/nvim-treesitter/nvim-treesitter' }
local ensure_installed = {
  'bash',
  'devicetree',
  'git_config',
  'gitignore',
  'html',
  'javascript',
  'json',
  'lua',
  'markdown',
  'regex',
  'scss',
  'sql',
  'tmux',
  'toml',
  'tsx',
  'typescript',
  'vim',
}
local treesitter = require 'nvim-treesitter'
local already_installed = require('nvim-treesitter.config').get_installed()
local parsers_to_install = vim
  .iter(ensure_installed)
  :filter(function(parser)
    return not vim.tbl_contains(already_installed, parser)
  end)
  :totable()

treesitter.install(parsers_to_install)
treesitter.setup()

vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    if vim.list_contains(treesitter.get_installed(), vim.treesitter.language.get_lang(args.match)) then
      vim.treesitter.start(args.buf)
    end
  end,
})
