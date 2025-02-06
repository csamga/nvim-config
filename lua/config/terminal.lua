local M = {}

local term_win = nil
local term_buf = nil

M.term_toggle = function(height)
   if term_win and vim.api.nvim_win_is_valid(term_win) then
      local cur_win = vim.api.nvim_get_current_win()

      if cur_win == term_win then
         -- Hide terminal if focused
         vim.cmd('hide')
      else
         -- Focus terminal if visible and not focused
         vim.api.nvim_set_current_win(term_win)
      end

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
      vim.wo.number = false
      vim.wo.relativenumber = false
   end

   vim.cmd.startinsert()
end

return M
