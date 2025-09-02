return {
  'nvim-mini/mini.nvim',
  version = false,
  config = function()
    require('mini.icons').setup()
    MiniIcons.mock_nvim_web_devicons()

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
    local starter = require 'mini.starter'
    starter.setup {
      items = {
        starter.sections.recent_files(5, true),
        starter.sections.sessions(5, true),
        starter.sections.builtin_actions(),
      },
    }
    require('mini.tabline').setup()
    require('mini.sessions').setup()
    require('mini.bufremove').setup()
    require('mini.indentscope').setup {
      options = {
        symbol = '│',
      },
    }
    local win_config = function()
      local height = math.floor(0.618 * vim.o.lines)
      local width = math.floor(0.618 * vim.o.columns)
      return {
        anchor = 'NW',
        height = height,
        width = width,
        row = math.floor(0.5 * (vim.o.lines - height)),
        col = math.floor(0.5 * (vim.o.columns - width)),
        border = 'rounded',
      }
    end
    require('mini.pick').setup {
      window = { config = win_config },
      mappings = {
        choose_marked = '<C-q>',
      },
    }
    require('mini.extra').setup()
  end,
  -- stylua: ignore start
  keys = {
    { 'gz', '', desc = '+surround' },
    { '<leader>bd', function() MiniBufremove.delete() end, desc = "Buffer delete" },
    { '<leader>bu', function() MiniBufremove.unshow_in_window() end, desc = "Buffer unshow" },
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
    {
      '<leader>sw',
      function()
        if next(MiniSessions.detected) == nil then
          vim.ui.input({ prompt = 'Enter session name' }, function(input)
            if input then
              MiniSessions.write(input)
            end
          end)
        else
          MiniSessions.select 'write'
        end
      end,
      { desc = 'Write Session' },
    },
    {
      '<leader>sr',
      function()
        MiniSessions.select 'read'
      end,
      { desc = 'Read Session' },
    },
    {
      '<leader>sd',
      function()
        MiniSessions.select 'delete'
      end,
      { desc = 'Delete Session' },
    },
    {
      '<leader>bd',
      function()
        MiniBufremove.delete()
      end,
      { desc = 'Delete Buffer' },
    },
    {
      '<leader>ff',
      function()
        MiniPick.builtin.files { tool = 'rg' }
      end,
    },
    {
      '<leader>sg',
      function()
        MiniPick.builtin.grep_live { tool = 'rg' }
      end,
    },
  },
  -- stylua: ignore end
}
