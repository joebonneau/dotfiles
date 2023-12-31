return {
  {
    "echasnovski/mini.move",
    version = false,
    mappings = {
      -- left = "<M-h>",
      -- right = "<M-l>",
      down = "<M-j>",
      up = "<leader><M-k>",
      line_left = "<M-h>",
      line_right = "<M-l>",
      line_down = "<M-j>",
      line_up = "<M-k>",
    },
  },
  {
    "echasnovski/mini.files",
    version = false,
    opts = {
      windows = {
        preview = false,
      },
      options = {
        use_as_default_explorer = true,
      },
      mappings = {
        synchronize = "w",
      },
    },
    keys = {
      {
        "<leader>e",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (directory of current file)",
      },
      {
        "<leader>E",
        function()
          require("mini.files").open(vim.loop.cwd(), true)
        end,
        desc = "Open mini.files (cwd)",
      },
      { "<leader>fm", false },
      { "<leader>fM", false },
    },
  },
}
