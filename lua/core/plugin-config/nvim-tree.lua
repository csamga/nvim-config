local M = {}

function M.config()
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1

	require('nvim-tree').setup {
		actions = {
			open_file = {
				quit_on_open = true,
			},
		},
		diagnostics = {
			enable = true,
		},
		modified = {
			enable = true,
		},
		renderer = {
			indent_width = 2,
			indent_markers = {
				enable = true,
			},
		},
		view = {
			width = 30,
			float = {
				enable = false,
			},
		},
	}
end

return M
