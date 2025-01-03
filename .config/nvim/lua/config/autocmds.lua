-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*tmux.conf" },
  command = "execute 'silent !tmux source <afile> --silent'",
})

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

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.dhtml" },
  command = "setlocal filetype=htmldjango",
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*tmux.conf" },
  command = "execute 'silent !tmux source <afile> --silent'",
})

-- local map_split = function(buf_id, lhs, direction)
--   local rhs = function()
--     -- Make new window and set it as target
--     local new_target_window
--     vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
--       vim.cmd(direction .. " split")
--       new_target_window = vim.api.nvim_get_current_win()
--     end)
--
--     -- Create target window and open highlighted file in split
--     MiniFiles.set_target_window(new_target_window)
--     MiniFiles.go_in({})
--   end
--
--   -- Adding `desc` will result into `show_help` entries
--   local desc = "Split " .. direction
--   vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
-- end
--
-- vim.api.nvim_create_autocmd("User", {
--   pattern = "MiniFilesBufferCreate",
--   callback = function(args)
--     local buf_id = args.data.buf_id
--     map_split(buf_id, "<C-x>", "horizontal")
--     map_split(buf_id, "<C-v>", "vertical")
--   end,
-- })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*.tsv",
  callback = function()
    vim.opt_local.expandtab = false
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*-query-*" },
  command = "setlocal filetype=sql",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "kanata.cfg",
  command = "setlocal commentstring=;;/ %s",
})

-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = {"*.md"},
--   command = "execute 'silent !tmux '"
-- })
