local cmp_kinds = {
   Text = '',
   Method = '',
   Function = '',
   Constructor = '',
   Field = '',
   Variable = '',
   Class = '',
   Interface = '',
   Module = '',
   Property = '',
   Unit = '',
   Value = '',
   Enum = '',
   Keyword = '',
   Snippet = '',
   Color = '',
   File = '',
   Reference = '',
   Folder = '',
   EnumMember = '',
   Constant = '',
   Struct = '',
   Event = '',
   Operator = '',
   TypeParameter = '',
}

local cmp_mappings = function()
   local cmp, luasnip = require('cmp'), require('luasnip')

   return {
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping(function(fallback)
         if cmp.visible() then
            if luasnip.expandable() then
               luasnip.expand()
            else
               cmp.confirm({
                  select = true,
                  behavior = cmp.ConfirmBehavior.Replace
               })
            end
         else
            fallback()
         end
      end),
      ['<Tab>'] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
         elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
         else
            fallback()
         end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
         elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
         else
            fallback()
         end
      end, { 'i', 's' }),
      ['<C-j>'] = cmp.mapping(function(fallback)
         if cmp.visible_docs() then
            cmp.scroll_docs(2)
         else
            fallback()
         end
      end, { 'i', 's' }),
      ['<C-k>'] = cmp.mapping(function(fallback)
         if cmp.visible_docs() then
            cmp.scroll_docs(-2)
         else
            fallback()
         end
      end, { 'i', 's' }),
   }
end

local cmp_options = function()
   local cmp, luasnip = require('cmp'), require('luasnip')

   return {
      enabled = function()
         local context = require('cmp.config.context')
         return not (
            context.in_treesitter_capture('comment') or
            context.in_syntax_group('Comment')
         )
      end,
      snippet = {
         expand = function(args)
            luasnip.lsp_expand(args.body)
         end
      },
      sources = cmp.config.sources({
         {
            name = 'lazydev',
            group_index = 0
         },
         {
            name = 'nvim_lsp',
            preselect = true,
         },
         { name = 'nvim_lsp_signature_help' },
         { name = 'path' },
      }),
      mapping = cmp_mappings(),
      matching = {
         disallow_fuzzy_matching = false,
         disallow_fullfuzzy_matching = false
      },
      formatting = {
         fields = { 'kind', 'abbr' },
         format = function(_, vim_item)
            vim_item.kind = cmp_kinds[vim_item.kind] or ''
            vim_item.abbr = vim.fn.trim(vim_item.abbr, ' ', 1)
            vim_item.menu = ''
            return vim_item
         end
      },
      view = {
         entries = {
            selection_order = 'near_cursor',
            follow_cursor = false
         }
      },
      window = {
         completion = {
            col_offset = -2,
            side_padding = 1,
         },
      },
      preselect = cmp.PreselectMode.Item,
      completion = {
         completeopt = 'menuone,popup',
      },
      performance = {
         max_view_entries = 40,
      },
      confirmation = {
         get_commit_characters = function(commit_characters)
            return vim.tbl_extend('keep', commit_characters, { '.' })
         end
      },
      experimental = {
         ghost_text = true,
      }
   }
end

local cmp_config = function(_, opts)
   local cmp = require('cmp')
   vim.o.pumheight = 20
   cmp.setup(opts)
   cmp.setup.filetype('TelescopePrompt', { enabled = false })

   local formatting = {
      fields = { 'abbr' },
      format = function(_, vim_item)
         vim_item.abbr = vim.fn.trim(vim_item.abbr, ' ', 1)
         vim_item.menu = ''
         vim_item.kind = ''
         return vim_item
      end,
      expandable_indicator = false
   }

   cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline({
         ['<CR>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
               cmp.confirm({
                  select = true,
                  behavior = cmp.ConfirmBehavior.Insert
               })
            else
               fallback()
            end
         end),
      }),
      sources = {
         {
            name = 'buffer',
            -- preselect = true,
         }
      },
      formatting = formatting,
      preselect = cmp.PreselectMode.None,
   })
   cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
         {
            name = 'cmdline',
            preselect = true,
         },
         {
            name = 'path',
            preselect = true,
         }
      },
      formatting = formatting,
   })

   local cmp_autopairs = require('nvim-autopairs.completion.cmp')
   cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
end

local spec = {
   'hrsh7th/nvim-cmp',
   dependencies = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      -- 'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'nvim-lspconfig',
   },
   event = { 'InsertEnter', 'CmdlineEnter' },
   enabled = true,
   opts = cmp_options,
   config = cmp_config
}

return spec
