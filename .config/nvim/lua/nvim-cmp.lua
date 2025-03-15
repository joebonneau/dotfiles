local matching = {
  disallow_fuzzy_matching = false,
  disallow_fullfuzzy_matching = false,
  disallow_partial_fuzzy_matching = false,
  disallow_partial_matching = false,
  disallow_prefix_unmatching = false,
}

return {
  "hrsh7th/nvim-cmp",
  version = false, -- last release is way too old
  enable = false,
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    {
      "garymjr/nvim-snippets",
      opts = {
        friendly_snippets = true,
        global_snippets = { "all", "global" },
      },
      dependencies = { "rafamadriz/friendly-snippets" },
    },
    "hrsh7th/cmp-path",
    "lukas-reineke/cmp-under-comparator",
  },
  opts = function(_, opts)
    opts.snippet = {
      expand = function(item)
        return LazyVim.cmp.expand(item.body)
      end,
    }
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    local cmp = require("cmp")
    local cmdline_mapping = {
      ["<CR>"] = cmp.mapping(cmp.mapping.confirm({ select = false }), { "c" }),
      ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }), { "c" }),
      ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }), { "c" }),
    }
    cmp.setup.cmdline("/", {
      mapping = cmdline_mapping,
      sources = {
        { name = "buffer" },
      },
      matching = matching,
    })
    cmp.setup.cmdline(":", {
      mapping = cmdline_mapping,
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline", option = {
          ignore_cmds = { "man", "!" },
        } },
      }),
      matching = matching,
    })
    local defaults = require("cmp.config.default")()
    return {
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
        end,
      },
      completion = {
        completeopt = "menu,menuone,noinsert,noselect",
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 6 },
        { name = "path", priority = 2 },
        { name = "codeium", priority = 4 },
        { name = "snippets", priority = 3 },
        { name = "vim-dadbod-completion", priority = 1 },
        {
          name = "buffer",
          priority = 5,
          option = {
            -- show completions from all buffers used within the last x minutes
            get_bufnrs = function()
              local mins = 15 -- CONFIG
              local recentBufs = vim
                .iter(vim.fn.getbufinfo({ buflisted = 1 }))
                :filter(function(buf)
                  return os.time() - buf.lastused < mins * 60
                end)
                :map(function(buf)
                  return buf.bufnr
                end)
                :totable()
              return recentBufs
            end,
            max_indexed_line_length = 100, -- no long lines (e.g. base64-encoded things)
          },
          keyword_length = 3,
          max_item_count = 4, -- since searching all buffers results in many results
        },
      }),
      formatting = {
        format = function(_, item)
          local icons = require("lazyvim.config").icons.kinds
          if icons[item.kind] then
            item.kind = icons[item.kind] .. item.kind
          end
          return item
        end,
      },
      experimental = {
        ghost_text = {
          hl_group = "CmpGhostText",
        },
      },
      -- sorting = defaults.sorting,
      sorting = {
        priority_weight = 1,
        comparators = {
          require("cmp-under-comparator").under,
          cmp.config.compare.locality,
          cmp.config.compare.offset,
          cmp.config.compare.order,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.exact,
        },
      },
      matching = matching,
    }
  end,
}
