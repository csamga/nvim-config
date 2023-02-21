local M = {}

function M.config()
	local on_attach = function(_, bufnr)
		vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorMoved' }, {
			buffer = bufnr,
			callback = function()
				local opts = {
					focusable = false,
					close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
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
		--nmap()
		--...
	end

	------ Mason LSPConfig
	local servers = {
		clangd = {
			clangd_complete_macros = true,
		},
		solidity = {},
		tsserver = {},
		html = {},
		cssls = {},
		jsonls = {},
		lua_ls = {
			Lua = {
				workspace = { checkThirdParty = false },
				telemetry = { enable = false },
				diagnostics = {
					globals = { 'vim' },
				},
			},
		},
	}

	------ Lua configuration ------
	require('neodev').setup()

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

	---- Mason
	require('mason').setup {
		ui = {
			icons = {
				package_pending = '➜',
			},
		},
	}

	local mason_lspconfig = require('mason-lspconfig')
	mason_lspconfig.setup {
		ensure_installed = vim.tbl_keys(servers),
	}

	mason_lspconfig.setup_handlers {
		function(server_name)
			require('lspconfig')[server_name].setup {
				capabilities = capabilities,
				on_attach = on_attach,
				settings = servers[server_name],
				handlers = {
					['textDocument/publishDiagnostics'] = vim.lsp.with(
						vim.lsp.diagnostic.on_publish_diagnostics, {
							virtual_text = false,
							signs = true,
							update_in_insert = false,
							underline = false,
						}
					)
				}
			}
		end,
	}

	------ LSP loading widget ------
	require('fidget').setup()

	----require('lspconfig').tsserver.setup {
	----    on_attach = function(client, bufnr)
	----            require('nvim-lsp-ts-utils').setup {
	----                    filter_out_diagnostics_by_code = { 80001 },
	----            }
	----            require('nvim-lsp-ts-utils').setup_client(client)
	----    end,
	----}
	--
end

return M
