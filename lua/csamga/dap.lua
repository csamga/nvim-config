local M = {}

function M.config()
  require('mason-nvim-dap').setup {
  	ensure_installed = {
  		'cpptools',
  	}
  }

  require('mason-nvim-dap').setup_handlers {}


  local dap = require('dap')

  dap.adapters.cppdbg = {
  	id = 'cppdbg',
  	type = 'executable',
  	command = '/home/csamga/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
  }

  dap.configurations.c = {
  	{
  		type = 'cppdbg';
  		request = 'launch';
  		name = 'Launch';
  	}
  }

  require('dap.ext.vscode').load_launchjs(nil, { cppdbg = { 'c', 'cpp' } })

  ------ DAP Configuration
  dap.configurations.c = {
  	{
  		name = 'Launch file',
  		type = 'cppdbg',
  		request = 'launch',
  		program = function()
  			return vim.fn.input({'Path to executable: ', vim.fn.getcwd() .. '/', 'file'})
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
end

return M
