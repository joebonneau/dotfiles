return {
  "ThePrimeagen/harpoon",
  dependencies = "nvim-lua/plenary.nvim",
  enabled = false,
  keys = {
    {
      "<leader>hh",
      "<cmd>Telescope harpoon marks<CR>",
      -- function()
      --   require("harpoon.ui").toggle_quick_menu()
      -- end,
      desc = "Show the harpoon menu",
      silent = true,
      mode = "n",
    },
    {
      "<leader>hm",
      function()
        require("harpoon.mark").add_file()
      end,
      desc = "Mark a file",
      silent = true,
      mode = "n",
    },
  },
  opts = {
    global_settings = { mark_branch = true },
    width = vim.api.nvim_win_get_width(0) - 3,
  },
}
