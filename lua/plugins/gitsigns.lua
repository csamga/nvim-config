local spec = {
   'lewis6991/gitsigns.nvim',
   event = 'VeryLazy',
   opts = {
      preview_config = {
         border = 'none'
      },
      on_attach = function(bufnr)
         local gitsigns = require('gitsigns')

         vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk)
         vim.keymap.set('n', '<leader>hs', gitsigns.stage_hunk)
         vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk)
         vim.keymap.set('v', '<leader>hs', function()
            gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
         end)
      end
   },
}

return spec
