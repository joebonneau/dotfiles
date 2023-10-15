return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    { "windwp/nvim-ts-autotag" },
    { "nvim-treesitter/nvim-treesitter-textobjects" },
  },
  opts = {
    autotag = {
      enable = true,
      enable_rename = true,
      enable_close_on_slash = false,
    },
    ensure_installed = {
      "go",
    },
  },
}
