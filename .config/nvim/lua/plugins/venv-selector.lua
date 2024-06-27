return {
  "linux-cultist/venv-selector.nvim",
  branch = "regexp",
  dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
  config = function()
    require("venv-selector").setup({
      settings = {
        search = {
          cwd = false,
          workspace = false,
          file_dir = false,
          my_search = {
            command = "fd /bin/python$ ~/.pyenv/versions --full-path -I -a -L -E /include -E /lib -E /share",
          },
        },
        options = {
          on_telescope_result_callback = function(path)
            -- return the venv name only
            return path:match("/versions/([^/]+)/bin/python")
          end,
        },
      },
    })
  end,
  lazy = false,
  keys = {
    { "<leader>vs", "<cmd>VenvSelect<cr>" },
    -- { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
  },
}
