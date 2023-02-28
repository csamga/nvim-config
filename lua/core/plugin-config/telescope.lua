local M = {}

function M.config()
	require('telescope').setup {
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = 'smart_case',
			},
		},
	}

	require('telescope').load_extension('fzf')

	local builtin = require('telescope.builtin')

	vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
	vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
	vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
	vim.keymap.set('n', '<leader> ' , builtin.buffers, {})
	--vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, {})
	vim.keymap.set('n', '<leader>gr', builtin.lsp_references, {})
	vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, {})
	vim.keymap.set('n', '<leader>mp', builtin.man_pages, {})
	vim.keymap.set('n', '<leader>dd', builtin.diagnostics, {})
	vim.keymap.set('n', '<leader>ts', builtin.treesitter, {})
	vim.keymap.set('n', '<leader>gi', builtin.lsp_implementations, {})
	vim.keymap.set('n', '<leader>td', builtin.lsp_type_definitions, {})
	vim.keymap.set('n', '<leader>bf', builtin.current_buffer_fuzzy_find, {})
	vim.keymap.set('n', '<leader>k' , builtin.keymaps, {})
end

return M
