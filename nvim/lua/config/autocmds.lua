-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--   pattern = { "*.gotmpl" },
--   command = "setlocal filetype=gotmpl | setlocal commentstring={{/*\\ %s\\ */}}')",
-- })

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argv(0) == "" then
      require("telescope.builtin").find_files()
    end
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { ".tmux.conf" },
  command = "execute 'silent !tmux source ~/.tmux.conf --silent'",
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { ".zshrc" },
  command = "execute 'silent !source .zshrc --silent'",
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "yabairc" },
  command = "!yabai --restart-service",
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { ".skhdrc" },
  command = "!skhd --restart-service",
})
