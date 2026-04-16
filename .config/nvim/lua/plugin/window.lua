-- window.lua: golden ratio autoresize + zoom toggle

local PHI = 1.618

local ignore_ft = { 'qf', 'help', 'nofile' }

local dadbod_ft = { 'dbui', 'dbout', 'dbquery' }

local function is_dadbod_active()
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.tbl_contains(dadbod_ft, vim.bo[buf].filetype) then
      return true
    end
  end
  return false
end

local function is_diffview_active()
  local ok, lib = pcall(require, 'diffview.lib')
  if not ok then
    return false
  end
  return lib.get_current_view() ~= nil
end

local function should_ignore()
  if is_diffview_active() or is_dadbod_active() then
    return true
  end
  local win = vim.api.nvim_get_current_win()
  local cfg = vim.api.nvim_win_get_config(win)
  if cfg.relative ~= '' then
    return true
  end
  if vim.tbl_contains(ignore_ft, vim.bo.filetype) then
    return true
  end
  if vim.bo.buftype ~= '' then
    return true
  end
  return false
end

local function apply_golden_ratio()
  if should_ignore() then
    return
  end

  local win = vim.api.nvim_get_current_win()
  local focused_w = math.floor(vim.o.columns / PHI)
  vim.api.nvim_win_set_width(win, focused_w)
end

-- Zoom toggle: maximize current window via winwidth,
-- navigate away normally with <C-h/j/k/l> and autoresize re-balances
local zoomed_win = nil

local function zoom_toggle()
  if is_diffview_active() or is_dadbod_active() then
    return
  end
  if zoomed_win ~= nil then
    vim.o.winwidth = 10
    vim.cmd 'wincmd ='
    zoomed_win = nil
  else
    vim.o.winwidth = 999
    zoomed_win = vim.api.nvim_get_current_win()
  end
end

local augroup = vim.api.nvim_create_augroup('GoldenRatio', { clear = true })
vim.api.nvim_create_autocmd('WinEnter', {
  group = augroup,
  callback = function()
    if should_ignore() then
      if zoomed_win ~= nil then
        zoom_toggle()
      end
      return
    end
    if zoomed_win ~= nil and vim.api.nvim_get_current_win() ~= zoomed_win then
      zoom_toggle()
    end
    apply_golden_ratio()
  end,
})

vim.keymap.set('n', '<leader>z', zoom_toggle, { desc = 'Zoom toggle' })
