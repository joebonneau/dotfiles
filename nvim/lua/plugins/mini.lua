return {
  {
    "echasnovski/mini.move",
    version = false,
    mappings = {
      down = "<M-j>",
      up = "<leader><M-k>",
      line_left = "<M-h>",
      line_right = "<M-l>",
      line_down = "<M-j>",
      line_up = "<M-k>",
    },
  },
  -- {
  --   "echasnovski/mini.files",
  --   version = false,
  --   opts = {
  --     windows = {
  --       preview = false,
  --     },
  --     options = {
  --       permanent_delete = false,
  --       use_as_default_explorer = true,
  --     },
  --     mappings = {
  --       synchronize = "w",
  --       go_in = "<CR>",
  --       go_out = "<BS>",
  --       reset = "<S-BS>",
  --     },
  --   },
  -- keys = {
  --   {
  --     "<leader>e",
  --     function()
  --       require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
  --     end,
  --     desc = "Open mini.files (directory of current file)",
  --   },
  --   {
  --     "<leader>E",
  --     function()
  --       require("mini.files").open(vim.loop.cwd(), true)
  --     end,
  --     desc = "Open mini.files (cwd)",
  --   },
  --   { "<leader>fm", false },
  --   { "<leader>fM", false },
  -- },
  -- },
}
