return {
  "nyngwang/NeoZoom.lua",
  config = function()
    require("neo-zoom").setup({
      popup = { enabled = true }, -- this is the default.
      exclude_buftypes = { "terminal" },
      exclude_filetypes = { "lspinfo", "mason", "lazy", "fzf", "qf" },
      winopts = {
        offset = {
          width = 150,
          height = 1,
        },
        -- NOTE: check :help nvim_open_win() for possible border values.
        border = "rounded",
      },
    })
    vim.keymap.set("n", "<CR>", function()
      vim.cmd("NeoZoomToggle")
    end, { silent = true, nowait = true })
  end,
}
