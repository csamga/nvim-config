local spec = {
   'saghen/blink.cmp',
   version = 'v0.*',
	enabled = false,
   opts = {
      keymap = {
         ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
         ['<C-e>'] = { 'hide', 'fallback' },
         ['<C-c>'] = { 'cancel', 'fallback' },
         ['<CR>'] = { 'accept', 'fallback' },
         ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
         ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
         ['<C-k>'] = { 'scroll_documentation_up', 'fallback' },
         ['<C-j>'] = { 'scroll_documentation_down', 'fallback' },
      },
      appearance = {
         use_nvim_cmp_as_default = true,
         nerd_font_variant = 'mono'
      },
      sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' }
		},
      signature = {
			enabled = true
		},
      completion = {
         list = {
				selection = 'auto_insert'
			},
         accept = {
            auto_brackets = {
               enabled = true,
            }
         },
         menu = {
            draw = {
               treesitter = true,
            }
         }
      },
      documentation = {
         auto_show = true,
      }
   }
}

return spec
