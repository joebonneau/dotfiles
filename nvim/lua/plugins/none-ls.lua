return {
  "nvimtools/none-ls.nvim",
  ensure_installed = { "black" },
  opts = function(_, opts)
    local nls = require("null-ls")
    table.insert(opts.sources, nls.builtins.formatting.prettierd)
    -- table.insert(opts.sources, nls.builtins.formatting.black)
    -- table.insert(opts.sources, nls.builtins.formatting.isort)
    -- table.insert(opts.sources, nls.builtins.diagnostics.flake8)
  end,
}
