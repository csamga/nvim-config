local options = function()
   -- local dark_hl = { fg = "#e7e0b2" }
   -- local light_hl = { fg = "#e6dc9d" }
   -- local hl
   -- if vim.o.background == "dark" then
   -- 	hl = dark_hl
   -- else
   -- 	hl = light_hl
   -- end
   return {
      attach_navic = true,
      show_dirname = false,
      show_modified = true,
      create_autocmd = false,
      context_follow_icon_color = true,
      -- custom_section = function(_, _)
      -- 	return os.date('%H:%M') .. ' '
      -- end,
      -- theme = {
      -- 	normal = hl
      -- }
   }
end

local config = function(_, opts)
   require('barbecue').setup(opts)

   vim.api.nvim_create_autocmd({
      -- "WinScrolled",
      'BufWinEnter',
      'CursorHold',
      'InsertLeave',
      'BufModifiedSet',
   }, {
      group = vim.api.nvim_create_augroup('barbecue.updater', {}),
      callback = function()
         require('barbecue.ui').update()
      end,
   })
end

local spec = {
   'utilyre/barbecue.nvim',
   version = '*',
   dependencies = {
      'SmiteshP/nvim-navic',
      { 'nvim-tree/nvim-web-devicons', commit = '9154484' },
   },
   event = 'LspAttach',
   opts = options,
   config = config,
}

return spec
