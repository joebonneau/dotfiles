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
    sources = {
      -- default = { "lsp", "path", "snippets" },
      per_filetype = { sql = { "dadbod" } },
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
    snippets = { preset = "default" },
  },
}
