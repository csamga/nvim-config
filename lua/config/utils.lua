local M = {}

M.set_background = function(day_range)
   local hour = os.date('*t').hour

   if (hour >= day_range.min and hour < day_range.max) then
      vim.o.background = 'light'
   else
      vim.o.background = 'dark'
   end
end

M.switch_background = function()
   local background = vim.o.background

   vim.o.background = (background == 'dark') and 'light' or 'dark'

   require('config.diagnostics').setup_signs()
end

return M
