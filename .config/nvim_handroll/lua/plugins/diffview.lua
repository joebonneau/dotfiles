return {
  'sindrets/diffview.nvim',
  dependencies = 'nvim-lua/plenary.nvim',
  cmd = {
    'DiffviewOpen',
    'DiffviewClose',
    'DiffviewToggleFiles',
    'DiffviewFocusFiles',
    'DiffviewRefresh',
  },
  config = function()
    local gitsigns = require 'gitsigns'
    local diffview = require 'diffview'
    local settings = {
      view = {
        use_icons = true,
        default = {
          layout = 'diff2_horizontal',
          winbar_info = false, -- See ':h diffview-config-view.x.winbar_info'
        },
        default_args = {
          DiffviewOpen = { '--imply-local' },
        },
      },
      keymaps = {
        view = {
          { 'n', '<leader>gs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' } },
          { 'n', '<leader>gr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' } },
          { 'n', '<leader>gS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' } },
          { 'n', '<leader>gu', gitsigns.stage_hunk, { desc = 'git [u]ndo stage hunk' } },
          { 'n', '<leader>gR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' } },
          { 'n', '<leader>gp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' } },
          { 'n', '<leader>gb', gitsigns.blame_line, { desc = 'git [b]lame line' } },
        },
      },
    }
    diffview.setup(settings)
  end,
}
