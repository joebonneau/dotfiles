return {
  "neovim/nvim-lspconfig",
  opts = {
    format = { timeout_ms = 1000 },
    servers = {
      emmet_language_server = {
        filetypes = { "gotmpl", "go", "javascriptreact", "typescriptreact" },
      },
    },
  },
}
