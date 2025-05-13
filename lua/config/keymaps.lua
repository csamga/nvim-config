local utils = require('config.utils')
local terminal = require('config.terminal')

vim.keymap.set('n', '<C-s>', vim.cmd.write)
vim.keymap.set('n', '<leader>cb', utils.switch_background)
vim.keymap.set('n', '<leader>x', '<cmd>source %<cr>')
vim.keymap.set('i', '<C-c>', '<Esc>')

vim.keymap.set({ 'n', 't' }, '<C-t>', function()
   terminal.term_toggle(16)
end, { noremap = true, silent = true, desc = 'Toggle terminal emulator' })

vim.keymap.set('n', '<C-B>', function()
   if vim.fn.executable('make') == 0 then
      vim.notify('Command \'make\' not found in path.', vim.log.levels.ERROR)
      return
   end

   if not (vim.uv.fs_stat('Makefile') or vim.uv.fs_stat('makefile')) then
      vim.notify('\'Makefile\' not found in CWD.', vim.log.levels.ERROR)
      return
   end

   terminal.term_toggle(16, 'make')

   vim.cmd.cgetexpr('system(\'make -n 2>&1\')')
   vim.cmd.cwindow()
end, { desc = 'Build with make' })

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
