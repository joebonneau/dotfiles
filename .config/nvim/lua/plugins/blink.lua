return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    },
    completion = {
      list = {
        selection = { preselect = false, auto_insert = false },
        cycle = { from_bottom = true, from_top = true },
      },
    },
    snippets = { preset = "mini_snippets" },
    sources = {
      default = { "buffer", "lsp", "path", "snippets" },
      per_filetype = { sql = { "snippets", "buffer", "dadbod" } },
      compat = { "codeium" },
      providers = {
        dadbod = {
          name = "Dadbod",
          module = "vim_dadbod_completion.blink",
        },
        codeium = {
          kind = "Codeium",
          score_offset = -10,
          async = true,
        },
      },
    },
    cmdline = {
      sources = { "buffer", "cmdline" },
    },
  },
}
