vim.pack.add {
  'https://github.com/windwp/nvim-ts-autotag',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nvim-treesitter/nvim-treesitter-context',
  'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
  'https://codeberg.org/andyg/leap.nvim',
}
require('nvim-ts-autotag').setup()

local ensure_installed = {
  'bash',
  'devicetree',
  'git_config',
  'gitignore',
  'html',
  'javascript',
  'json',
  'lua',
  'markdown',
  'regex',
  'scss',
  'sql',
  'tmux',
  'toml',
  'tsx',
  'typescript',
  'vim',
}
local treesitter = require 'nvim-treesitter'
local already_installed = require('nvim-treesitter.config').get_installed()
local parsers_to_install = vim
  .iter(ensure_installed)
  :filter(function(parser)
    return not vim.tbl_contains(already_installed, parser)
  end)
  :totable()

treesitter.install(parsers_to_install)
treesitter.setup()

vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    if vim.list_contains(treesitter.get_installed(), vim.treesitter.language.get_lang(args.match)) then
      vim.treesitter.start(args.buf)
    end
  end,
})

vim.g.no_plugin_maps = true
require('nvim-treesitter-textobjects').setup()

vim.keymap.set({ 'x', 'o' }, 'af', function()
  require('nvim-treesitter-textobjects.select').select_textobject('@function.outer', 'textobjects')
end)
vim.keymap.set({ 'x', 'o' }, 'if', function()
  require('nvim-treesitter-textobjects.select').select_textobject('@function.inner', 'textobjects')
end)
vim.keymap.set({ 'x', 'o' }, 'ac', function()
  require('nvim-treesitter-textobjects.select').select_textobject('@class.outer', 'textobjects')
end)
vim.keymap.set({ 'x', 'o' }, 'ic', function()
  require('nvim-treesitter-textobjects.select').select_textobject('@class.inner', 'textobjects')
end)

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
