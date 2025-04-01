return {
  {
    "echasnovski/mini.move",
    version = false,
    mappings = {
      down = "<M-j>",
      up = "<leader><M-k>",
      line_left = "<M-h>",
      line_right = "<M-l>",
      line_down = "<M-j>",
      line_up = "<M-k>",
    },
  },
  {
    "echasnovski/mini.snippets",
    opts = function()
      local mini_snippets = require("mini.snippets")
      return {
        snippets = {
          mini_snippets.gen_loader.from_lang(),
          mini_snippets.gen_loader.from_file("~/.config/nvim/snippets/global.json"),
        },
      }
    end,
  },
}
