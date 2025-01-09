local M = {}

M.setup_diagnostics = function(client)
   vim.diagnostic.config({
      underline = false,
      virtual_text = false,
      float = {
         severity_sort = true,
         focusable = false,
         source = 'if_many',
         max_width = 50,
         header = 'Diagnostics: [' .. client.name .. ']'
      },
      severity_sort = true,
   })
end

M.setup_signs = function()
   for _, severity in ipairs({ 'Error', 'Warn', 'Info', 'Hint' }) do
      local linehl = 'DiagnosticSign' .. severity
      local numhl = 'DiagnosticLineNr' .. severity
      local hl = vim.api.nvim_get_hl(0, { name = linehl, link = false })
      vim.api.nvim_set_hl(0, numhl, { fg = hl.fg, bold = true })
      vim.fn.sign_define(linehl, {
         linehl = linehl,
         numhl = numhl,
         text = '',
         texthl = '',
      })
   end
end

M.setup_signs()

return M
