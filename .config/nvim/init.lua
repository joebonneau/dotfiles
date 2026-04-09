--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

require 'autocmds'
require 'options'
require 'keymaps'
require 'diagnostics'

for _, file in ipairs(vim.fn.globpath(vim.fn.stdpath 'config' .. '/lua/plugin', '*.lua', false, true)) do
  dofile(file)
end
