return {
  "nyngwang/NeoZoom.lua",
  config = function()
    require("neo-zoom").setup({
      popup = { enabled = true },
      exclude_buftypes = { "terminal" },
      exclude_filetypes = { "lspinfo", "mason", "lazy", "fzf", "qf", "oil" },
      winopts = {
        offset = {
          width = 1,
          height = 1,
        },
        -- NOTE: check :help nvim_open_win() for possible border values.
        border = "rounded",
      },
    })
    vim.keymap.set("n", "<C-z>", function()
      local bufs = vim.api.nvim_tabpage_list_wins(0)
      local num_bufs = 0
      for _ in pairs(bufs) do
        num_bufs = num_bufs + 1
      end
      if num_bufs > 1 then
        vim.cmd("NeoZoomToggle")
      end
    end, { silent = true, nowait = true })
  end,
}
