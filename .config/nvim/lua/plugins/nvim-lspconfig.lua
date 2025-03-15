return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      virtual_text = false,
    },
    format = { timeout_ms = 1000 },
    servers = {
      emmet_language_server = {
        filetypes = { "templ", "go", "html", "htmldjango", "javascriptreact", "typescriptreact" },
      },
      pyright = {
        -- handlers = {
        --   ["textDocument/publishDiagnostics"] = function() end,
        -- },
        -- on_attach = function(client, _)
        --   client.server_capabilities.codeActionProvider = false
        -- end,
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
      rust_analyzers = { enabled = true },
    },
    inlay_hints = { enabled = false },
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
  },
}
