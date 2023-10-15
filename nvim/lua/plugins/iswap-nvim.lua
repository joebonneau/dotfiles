return {
  "mizlan/iswap.nvim",
  config = function()
    require("iswap").setup({
      flash_style = "simultaneous",
    })
  end,
  keys = {
    { "<leader>R", "<cmd>ISwap<CR>", mode = "n", desc = "Swap lines/arguments" },
    { "<leader>r", "<cmd>ISwapNodeWith<CR>", mode = "n", desc = "Swap nodes" },
  },
}
