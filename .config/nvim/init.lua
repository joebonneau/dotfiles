--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

require 'core.core'
require 'core.autocmds'
require 'core.lsp'
require 'options'
require 'keymaps'
