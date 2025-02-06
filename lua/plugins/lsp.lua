-- local extmark_ns = vim.api.nvim_create_namespace('code-actions-extmark')
--
-- local code_action_listener = function()
--    -- opti this
--    vim.api.nvim_set_hl(0, 'Bulb', { default = true, fg = 'NvimLightYellow' })
--
--    local bufnr = vim.api.nvim_get_current_buf()
--    local params = vim.lsp.util.make_range_params()
--    params.context = {
--       diagnostics = vim.diagnostic.get(bufnr, { lnum = vim.fn.line('.') - 1 }),
--       only = {
--          'quickfix',
--          'refactor.extract',
--          'refactor.inline',
--          'source'
--       },
--       triggerKind = 1
--    }
--    local pos = {
--       line = params.range.start.line,
--       col = params.range.start.character
--    }
--
--    pcall(vim.b[bufnr].cancel_code_action_requests)
--
--    vim.b[bufnr].cancel_code_action_requests = vim.lsp.buf_request_all(bufnr, 'textDocument/codeAction', params,
--       function(responses)
--          local has_actions = false
--
--          for _, response in pairs(responses) do
--             if response.result and not vim.tbl_isempty(response.result) then
--                local filtered = vim.tbl_filter(function(action)
--                   return action.kind ~= 'refactor.rewrite'
--                end, response.result)
--                if not vim.tbl_isempty(filtered) then
--                   has_actions = true
--                   break
--                end
--             end
--          end
--
--          if not has_actions then
--             local extmark_id = vim.b[bufnr].extmark_id
--             if extmark_id ~= nil then
--                vim.api.nvim_buf_del_extmark(bufnr, extmark_ns, extmark_id)
--                vim.b[bufnr].extmark_id = nil
--             end
--             return
--          end
--
--          local opts = {
--             id = vim.b[bufnr].extmark_id,
--             virt_text = { { '', 'Bulb' } },
--             hl_mode = 'combine',
--             virt_text_pos = 'eol',
--             strict = false
--          }
--          local first_char = vim.api.nvim_get_current_line():match('%s*'):len()
--          if first_char > 2 then
--             opts.virt_text_win_col = 0
--             -- issue: doesn't take into account tabs
--             -- opts.virt_text_win_col = math.max(first_char - 2, 0)
--             -- opts.virt_text_win_col = math.min(pos.col - 2, opts.virt_text_win_col)
--          end
--          vim.b[bufnr].extmark_id = vim.api.nvim_buf_set_extmark(bufnr, extmark_ns, pos.line, pos.col, opts)
--       end)
-- end
--
-- vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
--    group = vim.api.nvim_create_augroup('code-action-sign', { clear = true }),
--    callback = function()
--       code_action_listener()
--    end
-- })

local on_attach = function(client, bufnr)
   require('config.diagnostics').setup_diagnostics(client)

   vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, {})
   vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, {})
   vim.keymap.set('n', '<S-d>', vim.diagnostic.open_float, {})
   vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})

   local format_callback = function()
      vim.lsp.buf.format({
         filter = function(fmt_client) return fmt_client.name ~= 'clangd' end,
         timeout_ms = 4000
      })
   end
   vim.keymap.set('n', '<leader>f', format_callback, { desc = 'Format file' })
   vim.api.nvim_create_autocmd('BufWritePre', {
      callback = function()
         local nLines = vim.api.nvim_buf_line_count(0)
         if (nLines > 1000) then return end
         format_callback()
      end
   })

   local builtin = require('telescope.builtin')
   vim.keymap.set('n', '<leader>D', builtin.diagnostics, {})
   vim.keymap.set('n', '<leader>df', builtin.lsp_definitions, {})
   vim.keymap.set('n', '<leader>rf', builtin.lsp_references, {})
   vim.keymap.set('n', '<leader>ca', function()
      vim.lsp.buf.code_action({
         context = {
            only = {
               'quickfix',
               'refactor.extract',
               'refactor.inline',
               'source'
            }
         },
         filter = function(action)
            return action.kind ~= 'refactor.rewrite'
         end
      })
   end)

   vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
      vim.lsp.handlers.hover, {
         max_width = 50,
         max_height = 20,
      }
   )

   -- The following two autocommands are used to highlight references of the
   -- word under your cursor when your cursor rests there for a little while.
   -- See `:help CursorHold` for information about when this is executed
   -- When you move your cursor, the highlights will be cleared (the second autocommand).
   if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
      local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
         buffer = bufnr,
         group = highlight_augroup,
         callback = vim.lsp.buf.document_highlight
      })
      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
         buffer = bufnr,
         group = highlight_augroup,
         callback = vim.lsp.buf.clear_references,
      })
      vim.api.nvim_create_autocmd('LspDetach', {
         group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
         callback = function(event2)
            vim.lsp.buf.clear_references()
            vim.api.nvim_clear_autocmds({ group = 'lsp-highlight', buffer = event2.buf })
         end,
      })
   end
end

local spec = {
   {
      'williamboman/mason.nvim',
      event = 'VeryLazy',
   },
   {
      'williamboman/mason-lspconfig.nvim',
      event = 'VeryLazy'
   },
   {
      'neovim/nvim-lspconfig',
      event = 'Filetype',
      config = function()
         require('mason').setup()
         require('mason-lspconfig').setup()

         local lspconfig = require('lspconfig')
         -- local bin_path = vim.fn.stdpath('data') .. '/mason/bin/'
         local capabilities = require('cmp_nvim_lsp').default_capabilities()
         -- local capabilities = require('blink.cmp').get_lsp_capabilities()

         lspconfig.lua_ls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            -- cmd = { bin_path .. 'lua-language-server' },
            settings = {
               Lua = {
                  format = {
                     enable = true,
                     defaultConfig = {
                        quote_style = 'single',
                     }
                  }
               }
            }
         })
         lspconfig.clangd.setup({
            on_attach = function(client, bufnr)
               on_attach(client, bufnr)
               vim.keymap.set('n', '<A-o>', ':ClangdSwitchSourceHeader<CR>')
            end,
            capabilities = capabilities,
            cmd = {
               -- bin_path ..
               'clangd',
               '--header-insertion=never',
               '--query-driver=' ..
               'C:/msys64/ucrt64/bin/gcc.exe'
               -- .. 'C:/msys64/ucrt64/bin/g++.exe',
               -- 'C:/msys64/clang64/bin/clang.exe,'..
               -- 'C:/msys64/clang64/bin/clang++.exe'
            }
         })
         lspconfig.texlab.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            -- cmd = { bin_path .. 'texlab' },
            settings = {}
         })
         lspconfig.ts_ls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
         })
         lspconfig.quick_lint_js.setup({
            on_attach = on_attach,
            capabilities = capabilities,
         })
         lspconfig.html.setup({
            on_attach = on_attach,
            capabilities = capabilities,
         })
         lspconfig.cssls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
         })
         lspconfig.pylsp.setup({
            on_attach = on_attach,
            capabilities = capabilities,
         })
      end
   }
}

return spec
