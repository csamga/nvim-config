local M = {}

local ns = vim.api.nvim_create_namespace('extmark-test')

M.display = function()
   M.clear()

   local buf_height = vim.api.nvim_buf_line_count(0)
   local win_height = vim.api.nvim_win_get_height(0)
   local ratio = win_height / buf_height
   if ratio >= 1 then return end

   local win_first = vim.fn.line('w0') - 1
   local win_last = vim.fn.line('w$') - 1
   local rel_first = math.floor(win_first * ratio)
   local rel_last = math.floor(win_last * ratio)

   for i = rel_first, rel_last, 1 do
      local line = i + win_first
      vim.api.nvim_buf_set_extmark(0, ns, line, 0, {
         virt_text = { { ' ', 'ScrollBar' } },
         virt_text_pos = 'right_align',
         hl_mode = 'blend',
         strict = false,
         invalidate = true,
      })
   end
end

M.clear = function()
   vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
end

vim.keymap.set('n', '<leader>sb', M.display)

local render_events = {
   'BufWinEnter',
   'TabEnter',
   'TermEnter',
   'WinEnter',
   'CmdwinLeave',
   'TextChanged',
   'VimResized',
   'WinScrolled'
}
local clear_events = {
   'BufWinLeave',
   'TabLeave',
   'TermLeave',
   'WinLeave'
}
vim.api.nvim_create_autocmd(render_events, {
   callback = M.display
})
vim.api.nvim_create_autocmd(clear_events, {
   callback = M.clear
})
local setup_hl = function(_)
   if vim.o.background == 'dark' then
      vim.api.nvim_set_hl(0, 'ScrollBar', { bg = '#FFFFFF', blend = 90 })
   else
      vim.api.nvim_set_hl(0, 'ScrollBar', { bg = '#000000', blend = 90 })
   end
end
vim.api.nvim_create_autocmd('OptionSet', {
   pattern = 'background',
   callback = setup_hl
})
vim.api.nvim_create_autocmd('ColorScheme', {
   callback = setup_hl
})

return M
