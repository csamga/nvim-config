local M = {}

function M.config()
	require('lualine').setup {
		options = {
			icons_enabled = false,
			theme = 'vscode',
			component_separators = '|',
			section_separators = '',
		},
	}
end

return M
