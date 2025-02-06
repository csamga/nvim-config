local utils = require('config.utils')
local terminal = require('config.terminal')

vim.keymap.set('n', '<C-s>', vim.cmd.write)
vim.keymap.set('n', '<leader>cb', utils.switch_background)
vim.keymap.set('n', '<leader>x', '<cmd>source %<cr>')

vim.keymap.set('n', '<leader>st', function()
   terminal.term_toggle(16)
end, {
   noremap = true, silent = true
})

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

---- Credit: chris@machine ----
-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', {})
vim.keymap.set('v', '>', '>gv', {})

-- Paste without overriding current paste buffer
vim.keymap.set('x', 'p', '"_dP', {})

---- Credit: ThePrimeAgen ----
-- Move selected lines up/down following indentation
vim.keymap.set('v', '<A-j>', ":m '>+1<cr>gv=gv", {})
vim.keymap.set('v', '<A-k>', ":m '<-2<cr>gv=gv", {})

-- Search next/prev occurence keeping cursor verticaly centered
vim.keymap.set('n', 'n', 'nzzzv', {})
vim.keymap.set('n', 'N', 'Nzzzv', {})
