return {
  "fasterius/simple-zoom.nvim",
  config = true,
  keys = {
    {
      "<leader>z",
      function()
        require("simple-zoom").toggle_zoom()
      end,
      desc = "Zoom",
    },
  },
}
