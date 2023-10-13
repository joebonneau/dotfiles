-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "<C-e>", "<ESC>", { desc = "Exit insert mode with C-e" })
vim.keymap.set("n", "<leader>gm", "<Cmd>Gvdiffsplit!<CR>", { silent = true, desc = "3-pane resolve merge conflict" })

function _G.git_diff(opts)
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  -- try to get diff from master, if not, try from main
  local list = vim.fn.systemlist("git diff --name-only master")
  for _, text in ipairs(list) do
    if string.find(text, "fatal") then
      list = vim.fn.systemlist("git diff --name-only main")
      break
    end
  end
  local is_git_repo = true
  for _, text in ipairs(list) do
    if string.find(text, "Not a git repository") then
      is_git_repo = false
      break
    end
  end
  if is_git_repo then
    pickers
      .new(opts, {
        prompt_title = "files present in git diff",
        finder = finders.new_table({ results = list }),
        sorter = conf.generic_sorter(opts),
      })
      :find()
  else
    local notify = require("notify")
    notify("No files present in git diff.", vim.log.levels.WARN, { title = "Find in git diff" })
  end
end

function _G.git_diff_select_branch(opts)
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local compare_to_branch = "master"
  local branches = vim.fn.systemlist("git branch --all")
  vim.ui.select(branches, {}, function(input)
    if input ~= "" then
      compare_to_branch = input
      -- try to get diff from master, if not, try from main
      local list = vim.fn.systemlist(string.format("git diff --name-only %s", compare_to_branch))
      for _, text in ipairs(list) do
        if string.find(text, "fatal") then
          list = vim.fn.systemlist("git diff --name-only main")
          break
        end
      end
      local is_git_repo = true
      for _, text in ipairs(list) do
        if string.find(text, "Not a git repository") then
          is_git_repo = false
          break
        end
      end
      if is_git_repo then
        pickers
          .new(opts, {
            prompt_title = "files present in git diff",
            finder = finders.new_table({ results = list }),
            sorter = conf.generic_sorter(opts),
          })
          :find()
      else
        local notify = require("notify")
        notify("No files present in git diff.", vim.log.levels.WARN, { title = "Find in git diff" })
      end
    end
  end)
end

vim.keymap.set("n", "<leader>fD", "<:lua git_diff_select_branch()<CR>", { desc = "Find in git diff (select)" })
vim.keymap.set("n", "<leader>fd", "<:lua git_diff()<CR>", { desc = "Find in git diff (master)" })
