local M = {}

function M.config()
	require('lualine').setup {
		options = {
			icons_enabled = true,
			theme = 'vscode',
			component_separators = '|',
			section_separators = { left = '', right = '' },
		},
	}
end

return M
