return {
  "folke/ts-comments.nvim",
  opts = {
    lang = {
      devicetree = "// %s",
    },
  },
  event = "VeryLazy",
  enabled = vim.fn.has("nvim-0.10.0") == 1,
}
