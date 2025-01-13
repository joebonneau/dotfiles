return {
  "saghen/blink.cmp",
  version = "0.9.3",
  opts = {
    keymap = {
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    },
    completion = {
      list = {
        selection = "manual",
      },
    },
    sources = {
      cmdline = { "buffer", "cmdline" },
    },
  },
}
