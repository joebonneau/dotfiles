vim.pack.add { 'https://github.com/dlyongemallo/diffview.nvim' }
require('diffview').setup {
  keymaps = {
    disable_defaults = true,
    file_panel = {
      {
        'n',
        '<CR>',
        function()
          require('diffview.actions').select_entry()
        end,
        { desc = 'Select file' },
      },
    },
  },
}
