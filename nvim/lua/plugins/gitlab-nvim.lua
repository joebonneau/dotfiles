return {
  "harrisoncramer/gitlab.nvim",
  enabled = true,
  lazy = false,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
    enabled = true,
  },
  build = function()
    require("gitlab.server").build(true)
  end, -- Builds the Go binary
  config = function()
    require("gitlab").setup({
      reviewer = "diffview",
    })
  end,
  keys = {
    {
      "<leader>glr",
      function()
        require("gitlab").review()
      end,
      desc = "Review Gitlab MR",
    },
    {
      "<leader>gls",
      function()
        require("gitlab").summary()
      end,
      desc = "Show Gitlab MR summary",
    },
    {
      "<leader>glA",
      function()
        require("gitlab").approve()
      end,
      desc = "Approve Gitlab MR",
    },
    {
      "<leader>glR",
      function()
        require("gitlab").revoke()
      end,
      desc = "Revoke Gitlab MR approval",
    },
    {
      "<leader>glc",
      function()
        require("gitlab").create_comment()
      end,
      desc = "Create Gitlab MR comment",
    },
    {
      "<leader>gln",
      function()
        require("gitlab").create_note()
      end,
      desc = "Create Gitlab MR note",
    },
    {
      "<leader>gld",
      function()
        require("gitlab").toggle_discussions()
      end,
      desc = "Toggle Gitlab MR discussions",
    },
    {
      "<leader>glaa",
      function()
        require("gitlab").add_assignee()
      end,
      desc = "Add assignee to Gitlab MR",
    },
    {
      "<leader>glad",
      function()
        require("gitlab").delete_assignee()
      end,
      desc = "Delete assignee from Gitlab MR",
    },
    -- {
    --   "<leader>glra",
    --   function()
    --     require("gitlab").add_reviewer()
    --   end,
    --   desc = "Add reviewer to Gitlab MR",
    -- },
    -- {
    --   "<leader>glrd",
    --   function()
    --     require("gitlab").delete_reviewer()
    --   end,
    --   desc = "Delete reviewer from Gitlab MR",
    -- },
    {
      "<leader>glp",
      function()
        require("gitlab").pipeline()
      end,
      desc = "Show Gitlab MR pipeline",
    },
  },
}
