return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy", -- Or `LspAttach`
  priority = 1000, -- needs to be loaded in first
  config = function()
    vim.diagnostic.config({ virtual_text = false })
    require("tiny-inline-diagnostic").setup({
      options = {
        multilines = true,
        multiple_diag_under_cursor = true,
        show_all_diags_on_cursorline = true,
      },
      preset = "classic",
    })
  end,
}
