local M = {}

local term_win = nil
local term_buf = nil
local term_id = nil

M.term_toggle = function(height, cmd)
   if term_win and vim.api.nvim_win_is_valid(term_win) then
      vim.api.nvim_win_hide(term_win)
      return
   end

   -- Create new window at bottom
   vim.cmd.vnew()
   vim.cmd.wincmd('J')
   vim.api.nvim_win_set_height(0, height)
   term_win = vim.api.nvim_get_current_win()

   if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
      -- Terminal was previously openned, place its buffer in the window
      vim.api.nvim_win_set_buf(term_win, term_buf)
   else
      -- Terminal was't previously openned, create new terminal buffer
      vim.cmd.term()
      term_buf = vim.api.nvim_get_current_buf()
      term_id = vim.b.terminal_job_id
      vim.wo.number = false
      vim.wo.relativenumber = false
   end

   if cmd then
      vim.fn.chansend(term_id, cmd .. '\n')
   end

   vim.cmd.startinsert()
end

return M
