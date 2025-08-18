return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.surround').setup {
      mappings = {
        add = 'gza', -- Add surrounding in Normal and Visual modes
        delete = 'gzd', -- Delete surrounding
        find = 'gzf', -- Find surrounding (to the right)
        find_left = 'gzF', -- Find surrounding (to the left)
        highlight = 'gzh', -- Highlight surrounding
        replace = 'gzr', -- Replace surrounding
        update_n_lines = 'gzn', -- Update `n_lines`
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

    require('mini.pairs').setup()
    require('mini.animate').setup()
    require('mini.comment').setup()
    require('mini.cursorword').setup()
    require('mini.git').setup()
    require('mini.diff').setup()
    require('mini.trailspace').setup()
    require('mini.misc').setup()
  end,
  keys = {
    { 'gz', '', desc = '+surround' },
    {
      '<leader>z',
      function()
        require('mini.misc').zoom()
      end,
      'Zoom into the current buffer',
    },
  },
}
