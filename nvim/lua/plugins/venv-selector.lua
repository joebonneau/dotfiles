return {
  "linux-cultist/venv-selector.nvim",
  -- branch = "regexp",
  dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
  -- config = function()
  --   require("venv-selector").setup({
  --     settings = {
  --       search = {
  --         my_venvs = {
  --           command = "fd python$ ~/.pyenv/versions",
  --         },
  --       },
  --     },
  --   })
  -- end,
  lazy = false,
  keys = {
    { "<leader>vs", "<cmd>VenvSelect<cr>" },
    { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
  },
}
