vim.cmd([[
set guicursor=
]])

vim.opt.shortmess:append 'c'
vim.opt.path:append '**'
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.completeopt = { 'menuone', 'noinsert' }
vim.opt.cmdheight = 2
vim.opt.hlsearch = true
vim.opt.pumheight = 10
vim.opt.updatetime = 300
vim.opt.history = 200
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.showmode = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.fileencoding = "utf-8"
vim.opt.listchars = 'eol:¬,trail:↦,extends:>,precedes:<,space:·,tab:» '
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.list = true
vim.wo.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.wrap = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.timeoutlen = 100

vim.g.cursorhold_updatetime = 100
