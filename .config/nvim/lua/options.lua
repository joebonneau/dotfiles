vim.o.number = true
vim.o.mouse = 'a'
vim.o.showmode = false
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.termguicolors = true
vim.o.virtualedit = 'block'
vim.o.breakindent = true
vim.o.wrap = false
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = '  ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.termguicolors = true
vim.o.virtualedit = 'block'
vim.o.laststatus = 3
vim.o.cmdheight = 0
vim.o.showcmd = false
vim.o.showcmdloc = 'statusline'
vim.opt.shortmess:append 'I'

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- custom
vim.g.focus_disabled = false
