return {
  "neovim/nvim-lspconfig",
  -- config = function()
  --   local lspconfig = require("lspconfig")
  --
  --   lspconfig.gopls.setup({
  --     on_attach = function(client, bufnr)
  --       local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
  --
  --       if filetype == "gotmpl" then
  --         -- Disable gopls for .gotmpl files
  --         client.resolved_capabilities = {}
  --         return
  --       end
  --
  --       -- The rest of your gopls configuration
  --     end,
  --   })
  -- end,
  opts = {
    format = { timeout_ms = 1000 },
    servers = {
      emmet_language_server = {
<<<<<<< HEAD
        filetypes = { "gotmpl", "tmpl" },
        -- filetypes = { "gotmpl", "tmpl", "go" },
=======
        filetypes = { "gotmpl", "go", "javascriptreact", "typescriptreact" },
>>>>>>> be2613cebf5a3dd9b71e593da57a3d0947fe8416
      },
      gopls = {
        root_dir = function()
          return vim.loop.os_homedir()
        end,
      },
      -- gopls = {
      --   filetypes = { "go" },
      -- },
    },
  },
}
