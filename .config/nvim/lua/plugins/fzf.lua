return {
  'ibhagwan/fzf-lua',
  enabled = true,
  dependencies = { 'echasnovski/mini.icons' },
  opts = {
    oldfiles = {
      include_current_session = true,
    },
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
  },
  keys = {
    {
      '<leader>ff',
      function()
        local height = math.floor(0.618 * vim.o.lines)
        local width = math.floor(0.618 * vim.o.columns)
        FzfLua.combine {
          pickers = 'buffers;files',
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
      end,
      desc = 'Find files',
    },
    { '<leader>sg', '<cmd>FzfLua live_grep<cr>', desc = 'Grep (Root Dir)' },
  },
}
