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
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
    local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    treesitter_parser_config.gotmpl = {
      install_info = {
        url = "https://github.com/ngalaiko/tree-sitter-go-template",
        files = { "src/parser.c" },
      },
      filetype = "gotmpl",
      used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "tmpl" },
    }
  end,
}
