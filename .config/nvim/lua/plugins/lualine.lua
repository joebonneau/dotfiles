local function IsZoomedIn()
  if vim.t["simple-zoom"] == nil then
    return ""
  elseif vim.t["simple-zoom"] == "zoom" then
    return ""
  end
end

return {
  "nvim-lualine/lualine.nvim",
  opts = function()
    local icons = require("lazyvim.config").icons
    local Util = require("lazyvim.util")
    vim.o.laststatus = vim.g.lualine_laststatus

    return {
      options = {
        theme = "tokyonight",
        globalstatus = true,
        disabled_filetypes = {},
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { { "mode" } },
        lualine_b = {},
        lualine_c = {
          { IsZoomedIn },
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
            },
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
        lualine_x = {
          {
            require("noice").api.status.mode.get,
            cond = require("noice").api.status.mode.has,
            color = { fg = "#ff9e64" },
          },
          {
            require("noice").api.status.command.get,
            cond = function()
              return package.loaded["noice"] and require("noice").api.status.command.has()
            end,
            color = Util.ui.fg("Statement"),
          },
        },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {},
      },
      extensions = { "lazy", "mason", "oil" },
    }
  end,
}
