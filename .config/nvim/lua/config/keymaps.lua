-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- delete some default lazyvim keymaps
-- vim.keymap.del("n", "<leader>ft")
-- vim.keymap.del("n", "<leader>fT")
-- vim.keymap.del("n", "<leader>fn")
-- vim.keymap.del("n", "<leader>gs")
-- vim.keymap.del("n", "<leader>gb")
-- vim.keymap.del("n", "<leader>gB")
-- vim.keymap.del("n", "<leader>gY")
-- vim.keymap.del("n", "<leader>ghb")
-- vim.keymap.del("n", "<leader>ghB")
-- vim.keymap.del("n", "<leader>ghd")
-- vim.keymap.del("n", "<leader>ghD")
-- vim.keymap.del("n", "<leader>ghp")
-- vim.keymap.del("n", "<leader>ghr")
-- vim.keymap.del("n", "<leader>ghR")
-- vim.keymap.del("n", "<leader>ghs")
-- vim.keymap.del("n", "<leader>ghS")
-- vim.keymap.del("n", "<leader>ghu")

vim.api.nvim_create_user_command("W", function()
  vim.api.nvim_cmd({ cmd = "w" }, {})
end, {})

vim.api.nvim_create_user_command("Wq", function()
  vim.api.nvim_cmd({ cmd = "wq" }, {})
end, {})

-- Duplicate a line and comment out the first line
vim.keymap.set("n", "yc", function()
  vim.api.nvim_feedkeys("yygccp", "m", false)
end)

-- macros
vim.keymap.set("n", "Q", "@qj", { remap = true })
vim.keymap.set("x", "Q", ":norm @qj<CR>")

vim.keymap.set("n", "<leader>fd", ":lua get_git_diff_files()<CR>", { desc = "Find file in git diff" })

vim.api.nvim_create_user_command("DiagnosticsToggleVirtualText", function()
  local current_value = vim.diagnostic.config().virtual_lines.current_line
  if current_value then
    vim.diagnostic.config({ virtual_lines = { current_line = false } })
  else
    vim.diagnostic.config({ virtual_lines = { current_line = true } })
  end
end, {})

vim.keymap.set(
  "n",
  "<leader>di",
  "<cmd>DiagnosticsToggleVirtualText<CR>",
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

vim.keymap.set("n", "<localleader>z", ":SimpleZoomToggle<CR>")
