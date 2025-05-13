local options = {
   background = {
      light = 'jellybeans_light',
      dark = 'jellybeans'
   },
   italics = false,
   flat_ui = false,
   ---@diagnostic disable-next-line: unused-local
   on_highlights = function(highlight, colors)
      highlight.Visual = { reverse = true }
   end
}

local spec = {
   'wtfox/jellybeans.nvim',
   lazy = false,
   priority = 1000,
   opts = options,
}

return spec
