-- local options = {
-- bar = {
--    enable = function(buf, win, _)
--       if
--           not vim.api.nvim_buf_is_valid(buf)
--           or not vim.api.nvim_win_is_valid(win)
--           or vim.fn.win_gettype(win) ~= ''
--           or vim.wo[win].winbar ~= ''
--           or vim.bo[buf].ft == 'help'
--       -- or vim.bo[buf].ft == 'man'
--       -- or vim.bo[buf].buftype == 'terminal'
--       then
--          return false
--       end
--
--       local stat = vim.uv.fs_stat(vim.api.nvim_buf_get_name(buf))
--       if stat and stat.size > 1024 * 1024 then
--          return false
--       end
--
--       return vim.bo[buf].ft == 'markdown'
--           or pcall(vim.treesitter.get_parser, buf)
--           or not vim.tbl_isempty(vim.lsp.get_clients({
--              bufnr = buf,
--              method = 'textDocument/documentSymbol',
--           }))
--    end
-- },
-- menu = {
--    preview = false,
--    entry = {
--       padding = {
--          right = 4
--       }
--    }
-- }
-- }

local spec = {
   'Bekaboo/dropbar.nvim',
   config = function()
      local dropbar_api = require('dropbar.api')

      vim.ui.select = require('dropbar.utils.menu').select;

      vim.keymap.set('n', '<leader>;', dropbar_api.pick, {
         desc = 'Pick symbols in winbar'
      })
   end
}

return spec
