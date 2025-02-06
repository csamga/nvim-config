-- Enable splitbelow for man pages
vim.api.nvim_create_autocmd('BufWinEnter', {
   group = vim.api.nvim_create_augroup('ManSplitBelow', { clear = true }),
   pattern = 'man:/*',
   callback = function()
      vim.cmd.wincmd('J')
   end
})

local yank_group = vim.api.nvim_create_augroup('highlight_yank', { clear = true })
-- Highlight yanked line
vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
   pattern = '*',
   group = yank_group,
   callback = function()
      vim.highlight.on_yank({ timeout = 150 })
   end,
})
-- Save cursor position before moving when yanking multiple lines
vim.api.nvim_create_autocmd({ 'CursorMoved' }, {
   pattern = '*',
   group = yank_group,
   callback = function()
      vim.g.current_cursor_pos = vim.fn.getcurpos()
   end,
})
-- Restore cursor position after yanking
vim.api.nvim_create_autocmd('TextYankPost', {
   pattern = '*',
   group = yank_group,
   callback = function()
      if vim.v.event.operator == 'y' then
         vim.fn.setpos('.', vim.g.current_cursor_pos)
      end
   end,
})

vim.api.nvim_create_autocmd('TermOpen', {
   group = vim.api.nvim_create_augroup('terminal', { clear = true }),
   callback = function()
      vim.opt.number = false
      vim.opt.relativenumber = false
      local buf = vim.api.nvim_win_get_buf(0)
      vim.notify(vim.inspect(buf))
      vim.cmd.startinsert()
   end,
})
