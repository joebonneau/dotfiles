-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--   pattern = { "*.gotmpl" },
--   command = "setlocal filetype=gotmpl | setlocal commentstring={{/*\\ %s\\ */}}')",
-- })

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.html.tmpl" },
  callback = function()
    local filename = vim.api.nvim_buf_get_name(0)
    vim.cmd(
      string.format(
        "silent !prettier --write --plugin /opt/homebrew/lib/node_modules/prettier-plugin-go-template/lib/index.js %s",
        filename
      )
    )
  end,
})

-- gopls doesn't work unless the filetype is manually set, and
-- treesitter doesn't have a parser for gotmpl
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.html.tmpl" },
  command = "setlocal filetype=gotmpl | setlocal commentstring={{/*\\ %s\\ */}}",
})

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
