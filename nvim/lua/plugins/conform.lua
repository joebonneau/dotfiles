return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    formatters_by_ft = {
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
      python = { "ruff_format" },
      go = { "gofumpt", "goimports", "golines" },
      fish = { "fish_indent" },
      bash = { "shfmt" },
      htmldjango = { "djlint" },
    },
  },
}
