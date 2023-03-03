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
		transparent = false, 
		italic_comments = true,
		disable_nvimtree_bg = false,
		color_overrides = { -- See ./lua/vscode/colors.lua
			-- vscYellow = '#ffcd30',
		},
		group_overrides = { -- See ./lua/vscode/theme.lua
			DiagnosticWarn = { fg = '#ffaf00', bg = 'NONE', test },
			-- MatchParen = { fg = 'NONE', bg = c.vscSplitDark },
			-- Comment = { fg = c.vscGray, bg = 'NONE', italic = true },
		},
	}

	-- Workaround to change Treesitter comment highlight
	--[[ if background == 'dark' then
		vim.api.nvim_set_hl(0, '@comment', { fg = '#575757', bg = 'NONE', italic = true })
	else
		vim.api.nvim_set_hl(0, '@comment', { fg = '#a8a8a8', bg = 'NONE', italic = true })
		vim.api.nvim_set_hl(0, '@text.warning', { fg = '#ffcd30', bg = 'NONE', italic = true })
	end ]]

	-- Custom sign column
	local signs = { Error = '', Warn = '', Hint = '', Info = '' }
	for type, icon in pairs(signs) do
		local hl = 'DiagnosticSign' .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
end

return M
