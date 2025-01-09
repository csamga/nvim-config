local overrides = {
   dark = {
      CursorLine = { bg = '#232325' },
      CursorLineNr = { fg = '#5A5A5A', bg = '#232324' },
      Directory = { bg = 'none', fg = '#569cd6' },
      PmenuSel = { bg = '#2d3236' },
      TelescopeBorder = { fg = '#299999' },
      TelescopeMatching = { fg = '#ce9178', bold = true },
      TelescopeNormal = { bg = '#292929' },
      TelescopePreviewBorder = { link = 'TelescopePromptBorder' },
      TelescopePromptBorder = { bg = '#292929', fg = '#5a5a5a' },
      TelescopeResultsBorder = { link = 'TelescopePromptBorder' },
      TelescopeSelection = { reverse = true },
      VirtColumn = { bg = 'none', fg = '#232323' },
      Visual = { reverse = true },
      ['@comment'] = { fg = '#629959' },
      ['@constructor'] = {},
      ['@lsp.typemod.variable.readonly.c'] = {},
      ['@property'] = {},
      ['@punctuation.bracket'] = { fg = '#5a5a5a' },
      ['@punctuation.special'] = { fg = 'grey' },
      ['@variable'] = {},
      ['@variable.member'] = {},
      ['@variable.parameter'] = {},
      ['MatchParen'] = { bold = true, bg = '#2b2b2b' },
   },
   light = {
      CursorLine = { bg = '#f4f4f6' },
      CursorLineNr = { fg = '#098658', bg = '#f4f4f4' },
      Directory = { bg = 'none', fg = '#0000ff' },
      FloatBorder = { link = 'TelescopePromptBorder' },
      NormalFloat = { bg = '#eaecf3' },
      Pmenu = { bg = '#eaecf3' },
      PmenuSel = { reverse = true },
      TelescopeBorder = { fg = '#299999' },
      TelescopeNormal = { bg = '#ebebeb' },
      TelescopePreviewBorder = { link = 'TelescopePromptBorder' },
      TelescopePromptBorder = { fg = '#f2f2f2', bg = '#ebebeb' },
      TelescopeResultsBorder = { link = 'TelescopePromptBorder' },
      TelescopeSelection = { reverse = true },
      VirtColumn = { bg = 'none', fg = '#f2f2f2' },
      Visual = { reverse = true },
      ['@property'] = {},
      ['@punctuation.bracket'] = { fg = '#999999' },
      ['@punctuation.speciat'] = { fg = 'gray' },
      ['@variable'] = {},
      ['@variable.member'] = {},
      ['@variable.parameter'] = {},
      ['MatchParen'] = { bold = true },
   },
}

local config = function(_, opts)
   local bg = vim.o.background
   if bg == 'dark' then
      opts.group_overrides = overrides.dark
   else
      opts.group_overrides = overrides.light
   end

   require('vscode').setup(opts)

   vim.api.nvim_create_autocmd('OptionSet', {
      pattern = 'background',
      callback = function()
         if vim.g.colors_name ~= 'vscode' then return end

         local config = require('vscode.config').opts

         if vim.o.background == 'dark' then
            config.group_overrides = overrides.dark
         else
            config.group_overrides = overrides.light
         end
         require('vscode').setup(config)
         require('vscode').load(vim.o.background)
      end,
   })
end

local options = function()
   -- local colors = require("vscode.colors").get_colors()
   --
   -- if bg == "dark" then
   --		config.group_overrides = group_overrides.dark
   -- else
   --		config.group_overrides = group_overrides.light
   -- end

   return {
      -- group_overrides =
   }
end

local spec = {
   'Mofiqul/vscode.nvim',
   opts = options,
   config = config,
}

return spec
