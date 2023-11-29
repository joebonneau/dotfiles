return {
  "codethread/qmk.nvim",
  ft = { "c" },
  config = function()
    ---@type qmk.UserConfig
    local conf = {
      name = "LAYOUT_split_3x5_2",
      layout = {
        "x x x x x _ _ _ _ x x x x x",
        "x x x x x _ _ _ _ x x x x x",
        "x x x x x _ _ _ _ x x x x x",
        "_ _ _ _ x x _ _ x x _ _ _ _",
      },
    }
    require("qmk").setup(conf)
  end,
}
