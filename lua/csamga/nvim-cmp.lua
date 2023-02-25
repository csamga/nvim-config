local M = {}

function M.config()
	local cmp_kinds = {
		Text          = '',
		Method        = '',
		Function      = '',
		Constructor   = '',
		Field         = '',
		Variable      = '',
		Class         = '',
		Interface     = '',
		Module        = '',
		Property      = '',
		Unit          = '',
		Value         = '',
		Enum          = '',
		Keyword       = '',
		Snippet       = '',
		Color         = '',
		File          = '',
		Reference     = '',
		Folder        = '',
		EnumMember    = '',
		Constant      = '',
		Struct        = '',
		Event         = '',
		Operator      = '',
		TypeParameter = '',
	}

  local luasnip = require('luasnip')
  luasnip.config.setup {}

  local cmp = require('cmp')
  cmp.setup {
  	snippet = {
  		expand = function(args)
  			luasnip.lsp_expand(args.body)
  		end,
  	},

		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},

		view = {
			entries = { name = 'custom', selection_order = 'near_cursor' },
		},

		formatting = {
			fields = { 'kind', 'abbr' },
			format = function(_, vim_item)
				vim_item.kind = cmp_kinds[vim_item.kind] or ''
				vim_item.abbr = string.sub(vim_item.abbr, 1, 40)
				return vim_item
			end,
		},

  	mapping = cmp.mapping.preset.insert {
  		['<C-g>'] = cmp.mapping.scroll_docs(-1),
  		['<C-f>'] = cmp.mapping.scroll_docs(1),
  		['<C-Space>'] = cmp.mapping.complete({}),
  		['<C-e>'] = cmp.mapping.abort(),

  		['<CR>'] = cmp.mapping.confirm {
  			--behavior = cmp.ConfirmBehavior.Replace,
  			select = false,
  		},

  		['<Tab>'] = cmp.mapping(function(fallback)
  			if cmp.visible() then
  				cmp.select_next_item()
  			elseif luasnip.expand_or_jumpable() then
  				luasnip.expand_or_jump()
  			else
  				fallback()
  			end
  		end, { 'i', 's' }),

  		['<S-Tab>'] = cmp.mapping(function(fallback)
  			if cmp.visible() then
  				cmp.select_prev_item()
  			elseif luasnip.expand_or_jumpable(-1) then
  				luasnip.expand_or_jump(-1)
  			else
  				fallback()
  			end
  		end, { 'i', 's' })
  	},

  	sources = cmp.config.sources({
  		{ name = 'nvim_lsp' },
  		{ name = 'luasnip' },
		}, {
			{ name = 'buffer' },
  	}),
  }
end

return M
