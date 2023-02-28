-- Override Space key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', {
	silent = true,
})

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup(
	'YankHighlight', { clear = true }
)
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function ()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})

-- Go to next/prev line regardless of word wrap
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", {
	expr = true, silent = true
})
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", {
	expr = true, silent = true
})

-- Move selected lines up/down following indentation
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv")

-- Half page jumping keeping cursor verticaly centered
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Search next/prev occurence keeping cursor verticaly centered
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Paste without overriding current paste buffer
vim.keymap.set('x', '<leader>p', "\"_dP")

-- Toggle file explorer
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

-- Save file
vim.keymap.set('n', '<C-s>', ':w<CR>')

-- Source file
vim.keymap.set('n', '<A-s>', ':so<CR>')

-- Switch C header/source
vim.keymap.set('n', '<leader>h', ':ClangdSwitchSourceHeader<CR>')

-- Toggle light/dark background
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

