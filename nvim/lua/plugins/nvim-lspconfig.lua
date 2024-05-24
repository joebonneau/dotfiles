return {
  "neovim/nvim-lspconfig",
  opts = {
    format = { timeout_ms = 1000 },
    servers = {
      emmet_language_server = {
        filetypes = { "astro", "gotmpl", "go", "html", "htmldjango", "javascriptreact", "typescriptreact" },
      },
      htmx = { filetypes = { "htmldjango" } },
      pyright = {
        capabilities = (function()
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
          return capabilities
        end)(),
        settings = {
          python = {
            analysis = {
              useLibraryCodeForTypes = true,
              diagnosticSeverityOverrides = {
                reportUnusedVariable = "warning", -- or anything
              },
              typeCheckingMode = "basic",
            },
          },
        },
      },
      ruff_lsp = { enabled = false },
      ruff = { enabled = true },
    },
  },
  setup = {
    ruff = function()
      LazyVim.lsp.on_attach(function(client, _)
        if client.name == "ruff" then
          -- Disable hover in favor of Pyright
          client.server_capabilities.hoverProvider = false
        end
      end)
    end,
    pyright = function()
      LazyVim.lsp.on_attach(function(client, _)
        if client.name == "ruff" then
          -- Disable hover in favor of Pyright
          client.server_capabilities.hoverProvider = false
        end
      end)
    end,
  },
}
