local M = {}

function M.config()
	local kind_icons = {
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
	require('luasnip.loaders.from_vscode').lazy_load {}

  local cmp = require('cmp')
  cmp.setup {
  	snippet = {
  		expand = function(args)
  			luasnip.lsp_expand(args.body)
  		end,
  	},

		performance = {
			debounce = 50,
			throttle = 200,
			--fetching_timeout = 80,
		},

		completion = {
			keyword_length = 1,
		},

		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},

		view = {
			entries = { name = 'custom', selection_order = 'near_cursor' },
		},

		formatting = {
			fields = { 'abbr', 'kind', 'menu' },
			format = function(entry, vim_item)
				vim_item.abbr = string.sub(vim_item.abbr, 0, 32)
				vim_item.kind = kind_icons[vim_item.kind] or ''
				vim_item.menu = ({
					nvim_lsp = '[LSP]',
					luasnip = '[LuaSnip]',
					nvim_lua = '[Lua]',
				})[entry.source.name]
				return vim_item
			end,
		},

		sources = cmp.config.sources({
			{	name = 'nvim_lsp' },
			{ name = 'luasnip'  },
		}, {
			{ name = 'buffer'		},
			{	name = 'nvim_lua' },
  	}),
		--{ name = 'nvim_lsp_signature_help' },
		--{ name = 'nvim_lsp_document_symbol' },

  	mapping = cmp.mapping.preset.insert {
  		['<C-g>'] = cmp.mapping.scroll_docs(-1),
  		['<C-f>'] = cmp.mapping.scroll_docs(1),
  		['<C-Space>'] = cmp.mapping.complete {},
  		['<C-e>'] = cmp.mapping.abort(),

  		['<CR>'] = cmp.mapping.confirm { select = false },

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
  }
end

return M
