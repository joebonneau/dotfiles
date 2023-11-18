return {
  "folke/zen-mode.nvim",
  opts = {
    plugins = {
      tmux = { enabled = true },
      alacritty = { enabled = true },
    },
    -- window = {
    --   width = 200,
    -- },
    on_open = function()
      require("noice").disable()
      require("barbecue.ui").toggle(false)
      require("lualine").hide({ unhide = false, place = { "statusline", "tabline", "winbar" } })
      vim.g.miniindentscope_disable = true
      vim.fn.system("alacritty msg config font.size=20")
    end,
    on_close = function()
      require("noice").enable()
      require("barbecue.ui").toggle(true)
      require("lualine").hide({ unhide = true, place = { "statusline", "tabline", "winbar" } })
      vim.g.miniindentscope_disable = false
      vim.fn.system("alacritty msg config font.size=18")
    end,
  },
}
