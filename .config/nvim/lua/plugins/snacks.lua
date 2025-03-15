return {
  "folke/snacks.nvim",
  enabled = true,
  opts = {
    dashboard = {
      enabled = false,
    },
    notifier = {
      enabled = false,
    },
  },
  keys = {
    {
      "<leader>ff",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart picker",
    },
  },
}
