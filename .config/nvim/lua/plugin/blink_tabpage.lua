local M = {}

M.new = function()
  return setmetatable({}, { __index = M })
end

M.get_completions = function(self, ctx, callback)
  local tabpage = vim.api.nvim_get_current_tabpage()
  local wins = vim.api.nvim_tabpage_list_wins(tabpage)
  local current_buf = vim.api.nvim_get_current_buf()

  local seen_words = {}
  local items = {}

  for _, win in ipairs(wins) do
    local buf = vim.api.nvim_win_get_buf(win)
    if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
      local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
      for _, line in ipairs(lines) do
        for word in line:gmatch '[%w_%-]+' do
          if #word >= 3 and not seen_words[word] then
            seen_words[word] = true
            table.insert(items, {
              label = word,
              kind = require('blink.cmp.types').CompletionItemKind.Text,
              insertText = word,
            })
          end
        end
      end
    end
  end

  callback {
    items = items,
    is_incomplete_forward = false,
    is_incomplete_backward = false,
  }
end

return M
