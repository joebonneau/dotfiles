-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- delete some default lazyvim keymaps
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<leader>fn")
vim.keymap.del("n", "<leader>gg")
vim.keymap.del("n", "<leader>gG")

-- function _G.get_git_diff_files()
--   local pickers = require("telescope.pickers")
--   local finders = require("telescope.finders")
--   local conf = require("telescope.config").values
--   -- local list = vim.fn.systemlist("git diff --name-only $(git merge-base $(git branch --show-current) HEAD)")
--   local list = vim.fn.systemlist("git diff --name-only master HEAD")
--   local icons = require("nvim-web-devicons")
--   local is_git_repo = true
--   for _, text in ipairs(list) do
--     if string.find(text, "Not a git repository") then
--       is_git_repo = false
--       break
--     end
--   end
--   if is_git_repo then
--     local opts = {
--       layout_strategy = "horizontal",
--       layout_config = {
--         width = 0.5,
--         height = 0.5,
--       },
--     }
--     pickers
--       .new(opts, {
--         prompt_title = "Find in Git Diff",
--         finder = finders.new_table({
--           results = list,
--           entry_maker = function(entry)
--             local icon, _ = icons.get_icon(entry.value, vim.fn.fnamemodify(entry, ":e"), { default = true })
--             return {
--               value = entry,
--               ordinal = entry,
--               display = icon .. " " .. entry,
--             }
--           end,
--         }),
--
--         -- finder = finders.new_table({ results = list_with_icons }),
--         sorter = conf.file_sorter(opts),
--       })
--       :find()
--   else
--     local notify = require("notify")
--     notify("Current directory is not a git repo.", vim.log.levels.WARN, { title = "Find in git diff" })
--   end
-- end

vim.keymap.set("n", "<leader>fd", ":lua get_git_diff_files()<CR>", { desc = "Find file in git diff" })

vim.api.nvim_create_user_command("DiagnosticsToggleVirtualText", function()
  local current_value = vim.diagnostic.config().virtual_text
  if current_value then
    vim.diagnostic.config({ virtual_text = false })
  else
    vim.diagnostic.config({ virtual_text = true })
  end
end, {})

vim.keymap.set(
  "n",
  "<leader>di",
  "<cmd>DiagnosticsToggleVirtualText<CR>",
  { desc = "Toggle in-line diagnostics", silent = true }
)

vim.api.nvim_create_user_command("RunDockerTests", function()
  local filename = vim.fn.expand("%")
  local cmd = string.format('!ts -v -p "docker-compose run --rm app test --args=%s"', filename)
  vim.cmd(cmd)
end, {})

vim.keymap.set("n", "<leader>dt", "<cmd>RunDockerTests<CR>", { desc = "Run docker tests in split pane" })
vim.api.nvim_create_user_command("MakeFileExecutable", function()
  local notify = require("notify")
  vim.cmd("!chmod +x %")
  local filename = vim.fn.expand("%:t")
  notify(string.format("%s is now executable!", filename))
end, {})
vim.keymap.set(
  "n",
  "<leader>fx",
  "<cmd>MakeFileExecutable<CR>",
  { desc = "Make current file executable", silent = true }
)

vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Open git diff view", silent = true })
vim.keymap.set("n", "<leader>gD", "<cmd>DiffviewClose<CR>", { desc = "Close git diff view", silent = true })

vim.keymap.set("n", "<leader>o", "o<Esc>")
vim.keymap.set("n", "<leader>O", "O<Esc>")
