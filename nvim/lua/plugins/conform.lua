return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    formatters = {
      -- dtsfmt = {
      --   inherit = false,
      --   command = "dtsfmt",
      --   args = { "$FILENAME", "-" },
      --   cwd = function()
      --     local util = require("conform.util")
      --     return util.root_file({ ".dtsfmtrc.toml" })
      --   end,
      --   stdin = true,
      -- },
    },
    formatters_by_ft = {
      -- dts = { "dtsfmt" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescriptreact = { "prettierd" },
      css = { "prettierd", "stylelint" },
      html = { "prettierd" },
      json = { "prettierd" },
      yaml = { "prettierd" },
      markdown = { "prettierd" },
      graphql = { "prettierd" },
      lua = { "stylua" },
      python = { "ruff_format", "ruff_organize_imports" },
      go = { "gofumpt", "goimports", "golines" },
      fish = { "fish_indent" },
      bash = { "shfmt" },
      htmldjango = { "djlint" },
      rust = { "rustfmt" },
    },
  },
}
