return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon.setup()
    local function toggle_fzf(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('fzf-lua').fzf_exec(file_paths)
    end

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end)
    vim.keymap.set('n', '1', function()
      toggle_fzf(harpoon:list())
    end)
    vim.keymap.set('n', '<Tab>', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '4', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '5', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '6', function()
      harpoon:list():select(4)
    end)
  end,
}
