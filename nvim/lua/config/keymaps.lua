-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "<C-e>", "<ESC>", { desc = "Exit insert mode with C-e" })
vim.keymap.set("n", "<leader>gm", "<Cmd>Gvdiffsplit!<CR>", { silent = true, desc = "3-pane resolve merge conflict" })

function _G.get_git_diff_files()
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local previewers = require("telescope.previewers")
  local conf = require("telescope.config").values
  local list = vim.fn.systemlist("git diff --name-only $(git merge-base $(git branch --show-current) HEAD)")
  local icons = require("nvim-web-devicons")
  local is_git_repo = true
  local list_with_icons = {}
  for _, text in ipairs(list) do
    if string.find(text, "Not a git repository") then
      is_git_repo = false
      break
      -- else
      --   local icon, _ = icons.get_icon(text, vim.fn.fnamemodify(text, ":e"), { default = true })
      --   table.insert(list_with_icons, icon .. " " .. text)
    end
  end
  if is_git_repo then
    local opts = {
      layout_strategy = "horizontal",
      layout_config = {
        width = 0.5,
        height = 0.5,
      },
    }
    pickers
      .new(opts, {
        prompt_title = "Find in Git Diff",
        finder = finders.new_table({
          results = list,
          entry_maker = function(entry)
            local icon, _ = icons.get_icon(entry.value, vim.fn.fnamemodify(entry, ":e"), { default = true })
            return {
              value = entry,
              ordinal = entry,
              display = icon .. " " .. entry,
            }
          end,
        }),

        -- finder = finders.new_table({ results = list_with_icons }),
        sorter = conf.file_sorter(opts),
      })
      :find()
  else
    local notify = require("notify")
    notify("Current directory is not a git repo.", vim.log.levels.WARN, { title = "Find in git diff" })
  end
end

vim.keymap.set("n", "<leader>fd", ":lua get_git_diff_files()<CR>", { desc = "Find file in git diff" })
