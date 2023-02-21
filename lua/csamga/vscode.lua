local M = {}

function M.config()
	vim.o.termguicolors = true

	-- Launch Neovim with light theme at day and dark theme at night
	local hour = vim.fn.str2nr(vim.fn.strftime('%H'))
	local background = 'dark'

	if (hour >= 8 and hour < 18) then
		background = 'light'
	end

	vim.o.background = background

	local c = require('vscode.colors').get_colors()

	require('vscode').setup {
		-- Enable transparent background
		transparent = false,

		-- Enable italic comment
		italic_comments = true,

		-- Disable nvim-tree background color
		disable_nvimtree_bg = false,

		-- Override colors (see ./lua/vscode/colors.lua)
		color_overrides = {},

		-- Override highlight groups (see ./lua/vscode/theme.lua)
		-- this supports the same val table as vim.api.nvim_set_hl
		-- use colors from this colorscheme by requiring vscode.colors!
		group_overrides = {
			MatchParen = { fg = 'NONE', bg = c.vscSplitDark },
			Comment = { fg = c.vscGray, bg = 'NONE', italic = true },
		},
	}
		
	-- Workaround to change Treesitter comment highlight
	if background == 'dark' then
		vim.api.nvim_set_hl(0, '@comment', { fg = '#575757', bg = 'NONE', italic = true })
	else
		vim.api.nvim_set_hl(0, '@comment', { fg = '#a8a8a8', bg = 'NONE', italic = true })
	end
end

------ Custom sign column ------
local signs = { Error = '', Warn = '', Hint = '', Info = '' }
for type, icon in pairs(signs) do
	local hl = 'DiagnosticSign' .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.fn.sign_define('DapBreakpoint', {text = '🛑', texthl = '', linehl = '', numhl = '' })

return M
