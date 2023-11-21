return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "kkharji/sqlite.lua",
    { "prochri/telescope-all-recent.nvim", opts = {} },
    "AckslD/nvim-neoclip.lua",
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      version = "^1.0.0",
    },
    {
      "danielfalk/smart-open.nvim",
      branch = "0.2.x",
      config = function() end,
      dependencies = {
        "kkharji/sqlite.lua",
        { "nvim-telescope/telescope-fzy-native.nvim" },
      },
    },
  },
  -- apply the config and additionally load fzf-native
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("neoclip")
    telescope.load_extension("notify")
    telescope.load_extension("live_grep_args")
    telescope.load_extension("smart_open")
  end,

  opts = {
    defaults = {
      mappings = {
        i = {
          ["<C-n>"] = require("telescope.actions").cycle_history_next,
          ["<C-p>"] = require("telescope.actions").cycle_history_prev,
          ["<C-j>"] = require("telescope.actions").move_selection_next,
          ["<C-k>"] = require("telescope.actions").move_selection_previous,
        },
      },
      file_ignore_patterns = { ".git/", "node_modules" },
      layout_config = {
        height = 0.90,
        width = 0.90,
        preview_cutoff = 0,
        horizontal = { preview_width = 0.60 },
        vertical = { width = 0.55, height = 0.9, preview_cutoff = 0 },
        prompt_position = "bottom",
      },
      path_display = { "smart" },
      prompt_position = "top",
      prompt_prefix = " ",
      selection_caret = " ",
      sorting_strategy = "ascending",
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--hidden",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--trim", -- add this value
      },
    },
    pickers = {
      buffers = {
        prompt_prefix = "󰸩 ",
      },
      commands = {
        prompt_prefix = " ",
        layout_config = {
          height = 0.63,
          width = 0.78,
        },
      },
      command_history = {
        prompt_prefix = " ",
        layout_config = {
          height = 0.63,
          width = 0.58,
        },
      },
      git_files = {
        prompt_prefix = "󰊢 ",
        show_untracked = true,
      },
      find_files = {
        prompt_prefix = " ",
        find_command = { "fd", "-H" },
      },
      live_grep = {
        prompt_prefix = "󰱽 ",
      },
      grep_string = {
        prompt_prefix = "󰱽 ",
      },
    },
    -- extensions = {
    --   ["zf-native"] = {
    --     file = { -- options for sorting file-like items
    --       enable = true, -- override default telescope file sorter
    --       highlight_results = true, -- highlight matching text in results
    --       match_filename = true, -- enable zf filename match priority
    --     },
    --     generic = { -- options for sorting all other items
    --       enable = true, -- override default telescope generic item sorter
    --       highlight_results = true, -- highlight matching text in results
    --       match_filename = false, -- disable zf filename match priority
    --     },
    --   },
    -- },
  },
  keys = {
    { "<leader>*", "<cmd>Telescope grep_string<cr>", { silent = true, desc = "Grep Word Under Cursor" } },
    { "<leader>ff", "<cmd>Telescope smart_open<CR>", desc = "Find files" },
    { "<leader><space>", "<cmd>Telescope smart_open<CR>", desc = "Find files" },
    { "<leader>fc", "<cmd>Telescope commands<cr>", { silent = true, desc = "Find commands" } },
    { "<leader>fF", false },
    { "<leader>fr", false },
    { "<leader>fR", false },
  },
}
