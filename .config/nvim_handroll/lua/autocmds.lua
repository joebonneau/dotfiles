vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = { '*tmux.conf' },
  command = "execute 'silent !tmux source <afile> --silent'",
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*.tsv',
  callback = function()
    vim.opt_local.expandtab = false
  end,
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*-query-*' },
  command = 'setlocal filetype=sql',
})

vim.api.nvim_create_autocmd('TabEnter', {
  callback = function()
    local ok, diffview = pcall(require, 'diffview.lib')
    if ok and diffview.get_current_view() then
      require('focus').focus_disable_window()
    else
      require('focus').focus_enable_window()
    end
  end,
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'OilActionsPost',
  callback = function(event)
    if event.data.actions.type == 'move' then
      Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
    end
  end,
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesBufferCreate',
  callback = function(ev)
    vim.schedule(function()
      vim.api.nvim_buf_set_option(0, 'buftype', 'acwrite')
      vim.api.nvim_buf_set_name(ev.data.buf_id, 'mini-files-' .. ev.data.buf_id)
      -- vim.api.nvim_buf_set_name(0, tostring(vim.api.nvim_get_current_win()))
      vim.api.nvim_create_autocmd('BufWriteCmd', {
        buffer = ev.data.buf_id,
        callback = function()
          require('mini.files').synchronize()
        end,
      })
    end)
  end,
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesBufferCreate',
  callback = function(args)
    local buf_id = args.data.buf_id
    local mf = require 'mini.files'

    -- Helper for Enter: dive into directories, open files in current buffer
    local function open_or_dive()
      local entry = mf.get_fs_entry()
      if entry == nil then
        return
      end

      if entry.fs_type == 'directory' then
        mf.go_in()
      else
        mf.go_in() -- open file in active buffer
        mf.close() -- close mini.files
      end
    end

    -- Helper for Ctrl-v: always open file in vertical split
    local function open_vertical()
      local entry = mf.get_fs_entry()
      if entry == nil then
        return
      end

      if entry.fs_type == 'file' then
        -- Create a vertical split and make it the target window
        local cur_target = mf.get_explorer_state().target_window
        local new_target = vim.api.nvim_win_call(cur_target, function()
          vim.cmd 'belowright vsplit'
          return vim.api.nvim_get_current_win()
        end)

        mf.set_target_window(new_target)
        mf.go_in() -- open file in the new vertical split
        mf.close() -- close mini.files
      end
    end

    -- Map Enter for normal dive or open
    vim.keymap.set('n', '<CR>', open_or_dive, {
      buffer = buf_id,
      desc = 'Open file (and close) or dive into directory',
    })

    -- Map Ctrl-v for vertical split open
    vim.keymap.set('n', '<C-v>', open_vertical, {
      buffer = buf_id,
      desc = 'Open file in vertical split and close mini.files',
    })
  end,
})
