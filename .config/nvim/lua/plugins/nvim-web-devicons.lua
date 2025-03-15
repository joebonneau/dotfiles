return {
  "nvim-tree/nvim-web-devicons",
  enabled = true,
  config = function()
    require("mini.icons").setup()
    MiniIcons.mock_nvim_web_devicons()
  end,
}
