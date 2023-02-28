local M = {}

function M.config()
  require('mason-nvim-dap').setup {
  	ensure_installed = {
  		'cpptools',
  	}
  }

  require('mason-nvim-dap').setup_handlers {}

  local dap = require('dap')

	if vim.loop.os_uname().sysname == 'Windows_NT' then
		dap.adapters.cppdbg = {
			id = 'cppdbg',
			type = 'executable',
			command = vim.fn.stdpath('data')..'\\mason\\packages\\cpptools\\extension\\debugAdapters\\bin\\OpenDebugAD7.exe',
			options = {
				detached = false,
			},
		}
	else
		dap.adapters.cppdbg = {
			id = 'cppdbg',
			type = 'executable',
			command = vim.fn.stdpath('data')..'/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
		}
	end

	-- DAP configuration
	dap.configurations.c = {
		{
			name = 'Launch file',
			type = 'cppdbg',
			request = 'launch',
			program = function()
				return vim.fn.input {
					'Path to executable: ', vim.fn.getcwd() .. '/', 'file'
				}
			end,
			cwd = '${workspaceFolder}',
			MIMode = 'gdb',
			miDebuggerPath = '/usr/bin/gdb',
			setupCommands = {
				{
					text = '-enable-pretty-printing',
					description = 'enable pretty printing',
					ignoreFailures = false,
				}
			}
		}
	}

	vim.keymap.set('n', '<F5>', dap.continue)
	vim.keymap.set('n', '<F10>', dap.step_over)
	vim.keymap.set('n', '<F11>', dap.step_into)
	vim.keymap.set('n', '<F12>', dap.step_out)
	vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)

	require('dap.ext.vscode').load_launchjs(nil, {
		cppdbg = { 'c', 'cpp' }
	})

	require('dapui').setup {}

	require('neodev').setup {
		library = {
			plugins = {
				'nvim-dap-ui'
			},
			types = true
		},
	}
end

return M
