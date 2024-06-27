return {
  "folke/noice.nvim",
  enabled = true,
  opts = {
    cmdline = {
      format = {
        cmdline = { pattern = "^:", icon = "  ", lang = "vim" },
      },
      view = "cmdline",
    },
    messages = {
      enabled = true,
    },
    popupmenu = {
      enabled = false,
    },
    presets = {
      bottom_search = true,
    },
    lsp = {
      signature = {
        auto_open = {
          enabled = false,
        },
      },
    },
  },
}
