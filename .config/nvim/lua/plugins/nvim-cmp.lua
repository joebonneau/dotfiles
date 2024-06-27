return {
  "hrsh7th/nvim-cmp",
  version = false, -- last release is way too old
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    {
      "garymjr/nvim-snippets",
      opts = {
        friendly_snippets = true,
        global_snippets = { "all", "global" },
      },
      dependencies = { "rafamadriz/friendly-snippets" },
    },
    "hrsh7th/cmp-path",
  },
  opts = function(_, opts)
    opts.snippet = {
      expand = function(item)
        return LazyVim.cmp.expand(item.body)
      end,
    }
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    local cmp = require("cmp")
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
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-x>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<S-CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        }),
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      }),
      sources = cmp.config.sources(
        {
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "codeium" },
          { name = "snippets" },
        },
        --   {
        --   { name = "buffer" },
        -- },
        {
          name = "buffer",
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
        }
      ),
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
      sorting = defaults.sorting,
    }
  end,
}
