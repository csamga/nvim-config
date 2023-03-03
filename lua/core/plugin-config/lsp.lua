local M = {}

function M.config()
	-- Server list
	local servers = {
		clangd = {
			cmd = {
				'clangd',
				'--header-insertion=never',
				-- '--query-driver="/usr/bin/gcc"'
				'--target=x86_64-pc-linux-gnu',
			},
		},
		solidity = {},
		tsserver = {},
		html = {},
		cssls = {},
		jsonls = {},
		cmake = {},
		lua_ls = {
			Lua = {
				diagnostics = {
					globals = { 'vim' },
				},
				telemetry = {
					enable = false,
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file('', true),
					checkThirdParty = false,
				},
			},
		},
	}

	local mason = require('mason')
	local mason_lspconfig = require('mason-lspconfig')

	-- Mason
	mason.setup {
		ui = {
			border = 'rounded',
			width = 0.75,
			height = 0.65,
			icons = {
				package_pending = '➜',
			},
		},
	}

	-- LSP configuration
	mason_lspconfig.setup {
		ensure_installed = vim.tbl_keys(servers),
		ui = {
			border = 'rounded',
		},
	}

	-- This runs when a LS attaches to the current buffer
	local on_attach = function(_, bufnr)
		vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorMoved' }, {
			buffer = bufnr,
			callback = function()
				local opts = {
					focusable = false,
					close_events = {
						'BufLeave',
						'CursorMoved',
						'InsertEnter',
						'FocusLost',
					},
					border = 'rounded',
					source = 'always',
					prefix = '* ',
					scope = 'line',
				}
				vim.diagnostic.open_float(nil, opts)
			end,
		})

		local nmap = function(keys, func, desc)
			if desc then
				desc = 'LSP: ' .. desc
			end
			vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
		end

		nmap('<leader>dn', vim.diagnostic.goto_next, 'Jump to next diagnostic')
		nmap('<leader>dp', vim.diagnostic.goto_next, 'Jump to prev diagnostic')
		nmap('<leader>gd', vim.lsp.buf.definition, 'Jump to definition in split modn')
		nmap('<leader>rn', vim.lsp.buf.rename, 'Rename symbol')
	end

	-- Completion capabilities
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
	-- capabilities.textDocument.completion.completionItem.snippetSupport = true

	mason_lspconfig.setup_handlers {
		-- Default handler
		function(server_name)
			require('lspconfig')[server_name].setup {
				on_attach = on_attach,
				settings = servers[server_name],
				capabilities = capabilities,
			}
		end,

		-- tsserver handler
	--['tsserver'] = function(client)
	--	local ts_utils = require('nvim-lsp-ts-utils')
	--  ts_utils.setup {
	--  	filter_out_diagnostics_by_code = { 80001 },
	--  }
	--  ts_utils.setup_client(client)
	--end,
	}

  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  	vim.lsp.diagnostic.on_publish_diagnostics, {
  		virtual_text = false,
  		signs = true,
  		update_in_insert = false,
  		underline = false,
  	}
	)

  local function goto_definition(split_cmd)
  	local util = vim.lsp.util
  	local log = require("vim.lsp.log")
  	local api = vim.api

  	-- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
  	local handler = function(_, result, ctx)
  		if result == nil or vim.tbl_isempty(result) then
  			local _ = log.info() and log.info(ctx.method, "No location found")
  			return nil
  		end

  		if split_cmd then
  			vim.cmd(split_cmd)
  		end

  		if vim.tbl_islist(result) then
  			util.jump_to_location(result[1], 'utf-8')

  			if #result > 1 then
  				util.set_qflist(util.locations_to_items(result, 'utf-8'))
  				api.nvim_command("copen")
  				api.nvim_command("wincmd p")
  			end
  		else
  			util.jump_to_location(result, 'utf-8')
  		end
  	end
  	return handler
  end

	--vim.lsp.handlers['textDocument/definition'] = goto_definition('split')
end

return M
