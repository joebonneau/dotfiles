return {
  "stevearc/oil.nvim",
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    keymaps = {
      ["<BS>"] = "actions.parent",
      ["<C-v>"] = function()
        local oil = require("oil")
        oil.select({ vertical = true, close = true })
      end,
      ["<C-s>"] = function()
        local oil = require("oil")
        oil.select({ horizontal = true, close = true })
      end,
      -- ["<M-v>"] = "actions.select_vsplit",
      ["<M-v>"] = function()
        local oil = require("oil")
        oil.select({ vertical = true, close = false })
        local key = vim.api.nvim_replace_termcodes("<C-h>", true, false, true)
        vim.api.nvim_feedkeys(key, "n", false)
      end,
      ["<M-h>"] = "actions.select_split",
      ["<C-r>"] = "actions.refresh",
      ["<C-l>"] = false,
      ["<C-h>"] = false,
    },
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        local hide_files = { ".DS_Store", ".vite", ".pytest_cache", "__pycache__", "node_modules", ".ruff_cache" }
        for _, value in pairs(hide_files) do
          if name == value then
            return true
          end
        end
      end,
    },
  },
  keys = {
    { "<leader>e", "<cmd>Oil<CR>", mode = "n", desc = "Open Oil in current buffer location" },
    { "<leader>E", "<cmd>Oil.<CR>", mode = "n", desc = "Open Oil in cwd" },
  },
}
