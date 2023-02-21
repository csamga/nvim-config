vim.keymap.set('n', '<leader>e', vim.cmd.Explore)
vim.keymap.set('n', '<C-s>', ':w<CR>')

-- Keymap to toggle light/dark background
vim.keymap.set('n', '<leader>t', function()
	local background = vim.o.background
	local vscode = require('vscode')

	if background == 'dark' then
		vscode.change_style('light')
		vim.api.nvim_set_hl(0, '@comment', { fg = '#a8a8a8', bg = 'NONE', italic = true })
		vim.api.nvim_set_hl(0, 'MatchParen', { fg = '#ff00ff', bg = '#f0f0f0' })
	else
		vscode.change_style('dark')
		vim.api.nvim_set_hl(0, '@comment', { fg = '#575757', bg = 'NONE', italic = true })
		vim.api.nvim_set_hl(0, 'MatchParen', { fg = '#00ff00', bg = '#0f0f0f' })
	end
end)

vim.keymap.set('n', '<leader>h', ':ClangdSwitchSourceHeader<CR>')
