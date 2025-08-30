return {
  'nvim-mini/mini.nvim',
  version = false,
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.surround').setup {
      mappings = {
        add = 'gza', -- Add surrounding in Normal and Visual modes
        delete = 'gzd', -- Delete surrounding
        replace = 'gzr', -- Replace surrounding
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
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      skip_ts = { 'string' },
      -- skip autopair when next character is closing pair
      -- and there are more closing pairs than opening pairs
      skip_unbalanced = true,
      -- better deal with markdown code blocks
      markdown = true,
    }
    require('mini.animate').setup {
      resize = { enable = false },
    }
    require('mini.comment').setup()
    require('mini.cursorword').setup()
    require('mini.trailspace').setup()
    require('mini.files').setup {
      mappings = {
        close = 'bd',
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
  end,
  keys = {
    { 'gz', '', desc = '+surround' },
    {
      '<leader>e',
      function()
        if not MiniFiles.close() then
          MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
        end
      end,
      desc = 'Open mini.files in cwd',
    },
    {
      '<leader>E',
      function()
        if not MiniFiles.close() then
          MiniFiles.open(nil, false)
        end
      end,
      desc = 'Open mini.files in root',
    },
  },
}
