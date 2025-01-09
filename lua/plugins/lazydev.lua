local spec = {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = '${3rd}/luv/library', words = {'vim%.uv'}}
			}
		}
	},
	{
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, {
				name = "lazydev", group_index = 0
			})
			opts.library = opts.library or {}
			table.insert(opts.library, {
				plugins = {"nvim-dap-ui"}, types = true
			})
		end
	}
}

return spec
