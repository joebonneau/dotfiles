-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- delete some default lazyvim keymaps
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<leader>fn")

-- Duplicate a line and comment out the first line
vim.keymap.set("n", "yc", function()
  vim.api.nvim_feedkeys("yygccp", "m", false)
end)

-- macros
vim.keymap.set("n", "Q", "@qj", { remap = true })
vim.keymap.set("x", "Q", ":norm @qj<CR>")

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
  ":lua require('tiny-inline-diagnostic').toggle()<CR>",
  { desc = "Toggle in-line diagnostics", silent = true }
)

vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Open git diff view", silent = true })
vim.keymap.set("n", "<leader>gD", "<cmd>DiffviewClose<CR>", { desc = "Close git diff view", silent = true })

vim.keymap.set("n", "<leader>o", "o<Esc>")
vim.keymap.set("n", "<leader>O", "O<Esc>")

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "aerospace.toml" },
  command = "!aerospace reload-config",
})

-- Duplicate a line and comment out the first line
vim.keymap.set("n", "yc", "yygccp", { remap = true })
