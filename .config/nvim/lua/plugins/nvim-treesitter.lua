return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    config = function()
      -- When in diff mode, we want to use the default
      -- vim text objects c & C instead of the treesitter ones.
      local move = require("nvim-treesitter.textobjects.move") ---@type table<string,fun(...)>
      local configs = require("nvim-treesitter.configs")
      for name, fn in pairs(move) do
        if name:find("goto") == 1 then
          move[name] = function(q, ...)
            if vim.wo.diff then
              local config = configs.get_module("textobjects.move")[name] ---@type table<string,string>
              for key, query in pairs(config or {}) do
                if q == query and key:find("[%]%[][cC]") then
                  vim.cmd("normal! " .. key)
                  return
                end
              end
            end
            return fn(q, ...)
          end
        end
      end
      configs.setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["aa"] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
              ["av"] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
              ["ar"] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },
            },
          },
        },
      })
    end,
  },
  {
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
        "astro",
        "css",
        "devicetree",
        "fish",
        "go",
        "htmldjango",
        "rust",
        "scss",
        "tsx",
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
  },
}
