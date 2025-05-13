vim.opt.breakindent = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number,screenline'
vim.opt.expandtab = true
vim.opt.inccommand = 'split'
vim.opt.number = true
vim.opt.numberwidth = 3
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.clipboard:append('unnamedplus')

if (vim.uv.os_uname().sysname == 'Windows_NT') then
   vim.opt.shell = 'pwsh'
end

vim.opt.shiftwidth = 4
vim.opt.sidescrolloff = 4
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.timeoutlen = 250
vim.opt.updatetime = 100
vim.opt.wrap = false

local disabled_plugins = {
   'gzip',
   'zip',
   'netrw',
   'tar',
}

for _, plugin in pairs(disabled_plugins) do
   vim.g['loaded_' .. plugin] = true
end
