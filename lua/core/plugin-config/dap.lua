local M = {}

function M.config()
  require('mason-nvim-dap').setup {
  	ensure_installed = {
  		'cpptools',
  	}
  }

  -- require('mason-nvim-dap').setup_handlers {}

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
			name = 'Launch',
			type = 'cppdbg',
			request = 'launch',
			program = function()
      	return vim.fn.input('Path to executable: ',	vim.fn.getcwd() .. '/',	'file')
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

	dap.configurations.cpp = dap.configurations.c

	require('dap.ext.vscode').load_launchjs(nil, {
		cppdbg = { 'c', 'cpp' }
	})

	-- Keymaps
	vim.keymap.set('n', '<F5>', function()
		require('dap').continue()
	end)
	vim.keymap.set('n', '<F10>', function()
		require('dap').step_over()
	end)
	vim.keymap.set('n', '<F11>', function()
		require('dap').step_into()
	end)
	vim.keymap.set('n', '<F12>', function()
		require('dap').step_out()
	end)
	vim.keymap.set('n', '<leader>b', function()
		require('dap').toggle_breakpoint()
	end)
  vim.keymap.set('n', '<Leader>B', function()
		require('dap').set_breakpoint()
	end)
	vim.keymap.set('n', '<leader>lp', function()
		require('dap').set_breakpoint(nil, nil, vim.fn.input {
			'Log point message: ',
		})
	end)
	vim.keymap.set('n', '<leader>dr', function()
		require('dap').repl.open()
	end)
	vim.keymap.set('n', '<leader>dl', function()
		require('dap').run_last()
	end)
	vim.keymap.set({'n', 'v'}, '<leader>dh', function()
		require('dap.ui.widgets').hover()
	end)
	vim.keymap.set({'n', 'v'}, '<leader>dp', function()
		require('dap.ui.widgets').preview()
	end)
	vim.keymap.set('n', '<leader>df', function()
		local widgets = require('dap.ui.widgets')
		widgets.centered_float(widgets.frames)
	end)
	vim.keymap.set('n', '<leader>ds', function()
		local widgets = require('dap.ui.widgets')
		widgets.centered_float(widgets.scopes)
	end)

	require('dapui').setup {}

	require('neodev').setup {
		library = {
			plugins = {
				'nvim-dap-ui',
			},
			types = true,
		},
	}

	local dapui = require('dapui')
	dap.listeners.after.event_initialized['dapui_config'] = function ()
		dapui.open()
	end
	dap.listeners.before.event_terminated['dapui_config'] = function ()
		dapui.close()
	end
	dap.listeners.before.event_exited['dapui_config'] = function ()
		dapui.close()
	end

	require('nvim-dap-virtual-text').setup {
		enable = true,
		enabled_commands = true,
		commented = true,
		highlight_changed_variables = true,
		highlight_new_as_changed = true,
	}
end

return M
