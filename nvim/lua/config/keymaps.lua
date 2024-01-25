-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- delete some default lazyvim keymaps
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<leader>fn")
vim.keymap.del("n", "<leader>gg")
vim.keymap.del("n", "<leader>gG")

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
