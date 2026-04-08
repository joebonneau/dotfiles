vim.pack.add {
  'https://codeberg.org/andyg/leap.nvim',
}

require('leap.user').set_repeat_keys('.', ',')
vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)')
vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)')

-- f/F/t/T via leap
do
  local function as_ft(key_specific_args)
    local common_args = {
      inputlen = 1,
      inclusive = true,
      opts = {
        labels = '',
        safe_labels = vim.fn.mode(1):match '[no]' and '' or nil,
      },
    }
    return vim.tbl_deep_extend('keep', common_args, key_specific_args)
  end

  local clever = require('leap.user').with_traversal_keys
  local clever_f = clever('f', 'F')
  local clever_t = clever('t', 'T')

  for key, args in pairs {
    f = { opts = clever_f },
    F = { backward = true, opts = clever_f },
    t = { offset = -1, opts = clever_t },
    T = { backward = true, offset = 1, opts = clever_t },
  } do
    vim.keymap.set({ 'n', 'x', 'o' }, key, function()
      require('leap').leap(as_ft(args))
    end)
  end
end
