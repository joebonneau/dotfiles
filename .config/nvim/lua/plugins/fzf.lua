return {
  'ibhagwan/fzf-lua',
  enabled = false,
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
    -- { '<leader>ff', '<cmd>FzfLua files<cr>', desc = 'Find files' },
    {
      '<leader>fb',
      function()
        require('fzf-lua').buffers { previewer = false }
      end,
      desc = 'Open buffers',
    },
    -- { '<leader>sg', '<cmd>FzfLua live_grep<cr>', desc = 'Grep (Root Dir)' },
  },
}
