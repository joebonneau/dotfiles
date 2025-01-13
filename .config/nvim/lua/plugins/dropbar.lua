return {
  "Bekaboo/dropbar.nvim",
  config = function()
    require("dropbar").setup({
      bar = {
        sources = function(buf, _)
          local sources = require("dropbar.sources")
          return { sources.path }
        end,
      },
      icons = {
        kinds = {
          dir_icon = function()
            return nil, nil
          end,
        },
      },
      sources = {
        path = {
          max_depth = 5,
        },
      },
      symbol = {
        on_click = function() end,
      },
    })
  end,
}
