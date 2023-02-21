-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/csamga/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/csamga/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/csamga/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/csamga/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/csamga/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/csamga/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/csamga/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/csamga/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["fidget.nvim"] = {
    loaded = true,
    path = "/home/csamga/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/csamga/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\2n\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\2#show_trailing_blankline_indent\1\tchar\bâ”†\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/csamga/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\2–\1\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\1B\0\2\1K\0\1\0\foptions\1\0\0\1\0\4\23section_separators\5\25component_separators\6|\18icons_enabled\1\ntheme\vvscode\nsetup\flualine\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/csamga/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/csamga/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason-nvim-dap.nvim"] = {
    loaded = true,
    path = "/home/csamga/.local/share/nvim/site/pack/packer/start/mason-nvim-dap.nvim",
    url = "https://github.com/jay-babu/mason-nvim-dap.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/csamga/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neodev.nvim"] = {
    loaded = true,
    path = "/home/csamga/.local/share/nvim/site/pack/packer/start/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\2¼\1\0\0\a\0\t\0\0206\0\0\0'\1\1\0B\0\2\0029\1\2\0004\2\0\0B\1\2\0016\1\0\0'\2\3\0B\1\2\0026\2\0\0'\3\4\0B\2\2\0029\3\5\1\18\4\3\0009\3\6\3'\5\a\0009\6\b\2B\6\1\0A\3\2\1K\0\1\0\20on_confirm_done\17confirm_done\aon\nevent\"nvim-autopairs.completion.cmp\bcmp\nsetup\19nvim-autopairs\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/csamga/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "nvim-autopairs" },
    config = { "\27LJ\2\2-\0\1\3\1\2\0\5-\1\0\0009\1\0\0019\2\1\0B\1\2\1K\0\1\0\1À\tbody\15lsp_expandš\1\0\1\2\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\v€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisible¢\1\0\1\3\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\2ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\2ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\19expand_or_jump\23expand_or_jumpable\21select_prev_item\fvisible„\4\1\0\t\0\"\0@6\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0029\2\3\0019\2\4\0024\3\0\0B\2\2\0019\2\4\0005\3\b\0005\4\6\0003\5\5\0=\5\a\4=\4\t\0039\4\n\0009\4\v\0049\4\f\0045\5\14\0009\6\n\0009\6\r\6)\aüÿB\6\2\2=\6\15\0059\6\n\0009\6\r\6)\a\4\0B\6\2\2=\6\16\0059\6\n\0009\6\17\0064\a\0\0B\6\2\2=\6\18\0059\6\n\0009\6\19\0065\a\22\0009\b\20\0009\b\21\b=\b\23\aB\6\2\2=\6\24\0059\6\n\0003\a\25\0005\b\26\0B\6\3\2=\6\27\0059\6\n\0003\a\28\0005\b\29\0B\6\3\2=\6\30\5B\4\2\2=\4\n\0034\4\3\0005\5\31\0>\5\1\0045\5 \0>\5\2\4=\4!\3B\2\2\0012\0\0€K\0\1\0\fsources\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\vconfig\fluasnip\bcmp\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/csamga/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\2g\0\0\4\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\1\3\0006\2\0\0009\2\1\0029\2\4\2B\2\1\2'\3\5\0&\2\3\2'\3\6\0D\0\4\0\tfile\6/\vgetcwd\25Path to executable: \ninput\afn\bvimá\5\1\0\6\0\23\0.6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\1B\0\2\0016\0\0\0'\1\1\0B\0\2\0029\0\6\0004\1\0\0B\0\2\0016\0\0\0'\1\a\0B\0\2\0029\1\b\0005\2\n\0=\2\t\0019\1\v\0004\2\3\0005\3\r\0>\3\1\2=\2\f\0016\1\0\0'\2\14\0B\1\2\0029\1\15\1+\2\0\0005\3\17\0005\4\16\0=\4\t\3B\1\3\0019\1\v\0004\2\3\0005\3\18\0003\4\19\0=\4\20\0034\4\3\0005\5\21\0>\5\1\4=\4\22\3>\3\1\2=\2\f\1K\0\1\0\18setupCommands\1\0\3\16description\27enable pretty printing\ttext\28-enable-pretty-printing\19ignoreFailures\1\fprogram\0\1\0\6\frequest\vlaunch\tname\16Launch file\ttype\vcppdbg\vMIMode\bgdb\bcwd\23${workspaceFolder}\19miDebuggerPath\17/usr/bin/gdb\1\0\0\1\3\0\0\6c\bcpp\18load_launchjs\19dap.ext.vscode\1\0\3\frequest\vlaunch\tname\vLaunch\ttype\vcppdbg\6c\19configurations\1\0\3\aid\vcppdbg\fcommandd/home/csamga/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7\ttype\15executable\vcppdbg\radapters\bdap\19setup_handlers\21ensure_installed\1\0\0\1\2\0\0\rcpptools\nsetup\19mason-nvim-dap\frequire\0" },
    loaded = true,
    path = "/home/csamga/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/csamga/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/home/csamga/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils",
    url = "https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\2Å\1\0\0\4\0\6\0\n5\0\0\0005\1\1\0=\1\2\0006\1\3\0009\1\4\0019\1\5\1+\2\0\0\18\3\0\0B\1\3\1K\0\1\0\15open_float\15diagnostic\bvim\17close_events\1\5\0\0\rBufLeave\16CursorMoved\16InsertEnter\14FocusLost\1\0\5\nscope\tline\vprefix\a* \14focusable\1\vsource\valways\vborder\froundeds\0\3\t\1\b\0\17\15\0\2\0X\3\3€'\3\0\0\18\4\2\0&\2\4\0036\3\1\0009\3\2\0039\3\3\3'\4\4\0\18\5\0\0\18\6\1\0005\a\5\0-\b\0\0=\b\6\a=\2\a\aB\3\5\1K\0\1\0\1À\tdesc\vbuffer\1\0\0\6n\bset\vkeymap\bvim\nLSP: ƒ\1\1\2\6\0\t\0\f6\2\0\0009\2\1\0029\2\2\0025\3\3\0005\4\4\0=\1\5\0043\5\6\0=\5\a\4B\2\3\0013\2\b\0002\0\0€K\0\1\0\0\rcallback\0\vbuffer\1\0\0\1\3\0\0\15CursorHold\16CursorMoved\24nvim_create_autocmd\bapi\bvimÄ\2\0\1\a\3\16\0\0276\1\0\0'\2\1\0B\1\2\0028\1\0\0019\1\2\0015\2\3\0-\3\0\0=\3\4\2-\3\1\0=\3\5\2-\3\2\0008\3\0\3=\3\6\0025\3\r\0006\4\a\0009\4\b\0049\4\t\0046\5\a\0009\5\b\0059\5\n\0059\5\v\0055\6\f\0B\4\3\2=\4\14\3=\3\15\2B\1\2\1K\0\1\0\2€\0À\1À\rhandlers$textDocument/publishDiagnostics\1\0\0\1\0\4\14underline\1\nsigns\2\17virtual_text\1\21update_in_insert\1\27on_publish_diagnostics\15diagnostic\twith\blsp\bvim\rsettings\14on_attach\17capabilities\1\0\0\nsetup\14lspconfig\frequireµ\5\1\0\b\0+\0L3\0\0\0005\1\2\0005\2\1\0=\2\3\0014\2\0\0=\2\4\0014\2\0\0=\2\5\0014\2\0\0=\2\6\0014\2\0\0=\2\a\0014\2\0\0=\2\b\0015\2\18\0005\3\n\0005\4\t\0=\4\v\0035\4\f\0=\4\r\0035\4\15\0005\5\14\0=\5\16\4=\4\17\3=\3\19\2=\2\20\0016\2\21\0'\3\22\0B\2\2\0029\2\23\2B\2\1\0016\2\24\0009\2\25\0029\2\26\0029\2\27\2B\2\1\0026\3\21\0'\4\28\0B\3\2\0029\3\29\3\18\4\2\0B\3\2\2\18\2\3\0006\3\21\0'\4\30\0B\3\2\0029\3\23\0035\4\"\0005\5 \0005\6\31\0=\6!\5=\5#\4B\3\2\0016\3\21\0'\4$\0B\3\2\0029\4\23\0035\5&\0006\6\24\0009\6%\6\18\a\1\0B\6\2\2=\6'\5B\4\2\0019\4(\0034\5\3\0003\6)\0>\6\1\5B\4\2\0016\4\21\0'\5*\0B\4\2\0029\4\23\4B\4\1\0012\0\0€K\0\1\0\vfidget\0\19setup_handlers\21ensure_installed\1\0\0\rtbl_keys\20mason-lspconfig\aui\1\0\0\nicons\1\0\0\1\0\1\20package_pending\bâžœ\nmason\25default_capabilities\17cmp_nvim_lsp\29make_client_capabilities\rprotocol\blsp\bvim\nsetup\vneodev\frequire\vlua_ls\bLua\1\0\0\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\14telemetry\1\0\1\venable\1\14workspace\1\0\0\1\0\1\20checkThirdParty\1\vjsonls\ncssls\thtml\rtsserver\rsolidity\vclangd\1\0\0\1\0\1\27clangd_complete_macros\2\0\0" },
    loaded = true,
    path = "/home/csamga/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-autopairs", "nvim-ts-autotag", "nvim-treesitter-textobjects" },
    config = { "\27LJ\2\2Ô\2\0\0\4\0\14\0\0176\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0015\2\6\0005\3\a\0=\3\b\2=\2\t\0015\2\n\0=\2\v\0015\2\f\0=\2\r\1B\0\2\1K\0\1\0\fendwise\1\0\1\venable\2\fautotag\1\0\1\venable\2\14highlight\fdisable\1\2\0\0\tmake\1\0\2&additional_vim_regex_highlighting\1\venable\2\21ensure_installed\1\0\2\17auto_install\2\17sync_install\1\1\r\0\0\6c\bcpp\tmake\blua\tjson\njson5\bvim\thelp\rsolidity\15javascript\thtml\bcss\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/csamga/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/csamga/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\2A\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/csamga/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/csamga/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/csamga/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/csamga/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\2¾\a\0\0\6\0&\0‚\0016\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\0016\0\0\0'\1\3\0B\0\2\0026\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3\b\0009\4\t\0004\5\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3\n\0009\4\v\0004\5\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3\f\0009\4\r\0004\5\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3\14\0009\4\15\0004\5\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3\16\0009\4\17\0004\5\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3\18\0009\4\19\0004\5\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3\20\0009\4\21\0004\5\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3\22\0009\4\23\0004\5\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3\24\0009\4\25\0004\5\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3\26\0009\4\27\0004\5\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3\28\0009\4\29\0004\5\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3\30\0009\4\31\0004\5\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3 \0009\4!\0004\5\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3\"\0009\4#\0004\5\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3$\0009\4%\0004\5\0\0B\1\5\1K\0\1\0\fkeymaps\14<leader>k\30current_buffer_fuzzy_find\15<leader>bf\25lsp_type_definitions\15<leader>td\24lsp_implementations\15<leader>gi\15treesitter\15<leader>ts\16diagnostics\14<leader>d\14man_pages\15<leader>mp\25lsp_document_symbols\15<leader>ds\19lsp_references\15<leader>gr\20lsp_definitions\15<leader>gd\14help_tags\15<leader>fh\fbuffers\14<leader> \14live_grep\15<leader>fg\14git_files\15<leader>gf\15find_files\15<leader>ff\6n\bset\vkeymap\bvim\22telescope.builtin\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/csamga/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/csamga/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/csamga/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vscode.nvim"] = {
    after = { "lualine.nvim" },
    config = { "\27LJ\2\2ó\4\0\0\b\0 \0A6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0006\1\0\0009\1\3\0019\1\5\1'\2\6\0B\1\2\0A\0\0\2'\1\a\0)\2\b\0\3\2\0\0X\2\4€)\2\18\0\1\0\2\0X\2\1€'\1\b\0006\2\0\0009\2\1\2=\1\t\0026\2\n\0'\3\v\0B\2\2\0029\2\f\2B\2\1\0026\3\n\0'\4\r\0B\3\2\0029\3\14\0035\4\15\0004\5\0\0=\5\16\0045\5\20\0005\6\17\0009\a\18\2=\a\19\6=\6\21\0055\6\23\0009\a\22\2=\a\24\6=\6\25\5=\5\26\4B\3\2\1\a\1\a\0X\3\b€6\3\0\0009\3\27\0039\3\28\3)\4\0\0'\5\29\0005\6\30\0B\3\4\1X\3\a€6\3\0\0009\3\27\0039\3\28\3)\4\0\0'\5\29\0005\6\31\0B\3\4\1K\0\1\0\1\0\3\abg\tNONE\afg\f#a8a8a8\vitalic\2\1\0\3\abg\tNONE\afg\f#575757\vitalic\2\r@comment\16nvim_set_hl\bapi\20group_overrides\fComment\afg\1\0\2\abg\tNONE\vitalic\2\fvscGray\15MatchParen\1\0\0\abg\17vscSplitDark\1\0\1\afg\tNONE\20color_overrides\1\0\3\16transparent\1\20italic_comments\2\24disable_nvimtree_bg\1\nsetup\vvscode\15get_colors\18vscode.colors\frequire\15background\nlight\tdark\a%H\rstrftime\vstr2nr\afn\18termguicolors\6o\bvim\0" },
    loaded = true,
    only_config = true,
    path = "/home/csamga/.local/share/nvim/site/pack/packer/start/vscode.nvim",
    url = "https://github.com/Mofiqul/vscode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\2Å\1\0\0\4\0\6\0\n5\0\0\0005\1\1\0=\1\2\0006\1\3\0009\1\4\0019\1\5\1+\2\0\0\18\3\0\0B\1\3\1K\0\1\0\15open_float\15diagnostic\bvim\17close_events\1\5\0\0\rBufLeave\16CursorMoved\16InsertEnter\14FocusLost\1\0\5\nscope\tline\vprefix\a* \14focusable\1\vsource\valways\vborder\froundeds\0\3\t\1\b\0\17\15\0\2\0X\3\3€'\3\0\0\18\4\2\0&\2\4\0036\3\1\0009\3\2\0039\3\3\3'\4\4\0\18\5\0\0\18\6\1\0005\a\5\0-\b\0\0=\b\6\a=\2\a\aB\3\5\1K\0\1\0\1À\tdesc\vbuffer\1\0\0\6n\bset\vkeymap\bvim\nLSP: ƒ\1\1\2\6\0\t\0\f6\2\0\0009\2\1\0029\2\2\0025\3\3\0005\4\4\0=\1\5\0043\5\6\0=\5\a\4B\2\3\0013\2\b\0002\0\0€K\0\1\0\0\rcallback\0\vbuffer\1\0\0\1\3\0\0\15CursorHold\16CursorMoved\24nvim_create_autocmd\bapi\bvimÄ\2\0\1\a\3\16\0\0276\1\0\0'\2\1\0B\1\2\0028\1\0\0019\1\2\0015\2\3\0-\3\0\0=\3\4\2-\3\1\0=\3\5\2-\3\2\0008\3\0\3=\3\6\0025\3\r\0006\4\a\0009\4\b\0049\4\t\0046\5\a\0009\5\b\0059\5\n\0059\5\v\0055\6\f\0B\4\3\2=\4\14\3=\3\15\2B\1\2\1K\0\1\0\2€\0À\1À\rhandlers$textDocument/publishDiagnostics\1\0\0\1\0\4\14underline\1\nsigns\2\17virtual_text\1\21update_in_insert\1\27on_publish_diagnostics\15diagnostic\twith\blsp\bvim\rsettings\14on_attach\17capabilities\1\0\0\nsetup\14lspconfig\frequireµ\5\1\0\b\0+\0L3\0\0\0005\1\2\0005\2\1\0=\2\3\0014\2\0\0=\2\4\0014\2\0\0=\2\5\0014\2\0\0=\2\6\0014\2\0\0=\2\a\0014\2\0\0=\2\b\0015\2\18\0005\3\n\0005\4\t\0=\4\v\0035\4\f\0=\4\r\0035\4\15\0005\5\14\0=\5\16\4=\4\17\3=\3\19\2=\2\20\0016\2\21\0'\3\22\0B\2\2\0029\2\23\2B\2\1\0016\2\24\0009\2\25\0029\2\26\0029\2\27\2B\2\1\0026\3\21\0'\4\28\0B\3\2\0029\3\29\3\18\4\2\0B\3\2\2\18\2\3\0006\3\21\0'\4\30\0B\3\2\0029\3\23\0035\4\"\0005\5 \0005\6\31\0=\6!\5=\5#\4B\3\2\0016\3\21\0'\4$\0B\3\2\0029\4\23\0035\5&\0006\6\24\0009\6%\6\18\a\1\0B\6\2\2=\6'\5B\4\2\0019\4(\0034\5\3\0003\6)\0>\6\1\5B\4\2\0016\4\21\0'\5*\0B\4\2\0029\4\23\4B\4\1\0012\0\0€K\0\1\0\vfidget\0\19setup_handlers\21ensure_installed\1\0\0\rtbl_keys\20mason-lspconfig\aui\1\0\0\nicons\1\0\0\1\0\1\20package_pending\bâžœ\nmason\25default_capabilities\17cmp_nvim_lsp\29make_client_capabilities\rprotocol\blsp\bvim\nsetup\vneodev\frequire\vlua_ls\bLua\1\0\0\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\14telemetry\1\0\1\venable\1\14workspace\1\0\0\1\0\1\20checkThirdParty\1\vjsonls\ncssls\thtml\rtsserver\rsolidity\vclangd\1\0\0\1\0\1\27clangd_complete_macros\2\0\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\2g\0\0\4\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\1\3\0006\2\0\0009\2\1\0029\2\4\2B\2\1\2'\3\5\0&\2\3\2'\3\6\0D\0\4\0\tfile\6/\vgetcwd\25Path to executable: \ninput\afn\bvimá\5\1\0\6\0\23\0.6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\1B\0\2\0016\0\0\0'\1\1\0B\0\2\0029\0\6\0004\1\0\0B\0\2\0016\0\0\0'\1\a\0B\0\2\0029\1\b\0005\2\n\0=\2\t\0019\1\v\0004\2\3\0005\3\r\0>\3\1\2=\2\f\0016\1\0\0'\2\14\0B\1\2\0029\1\15\1+\2\0\0005\3\17\0005\4\16\0=\4\t\3B\1\3\0019\1\v\0004\2\3\0005\3\18\0003\4\19\0=\4\20\0034\4\3\0005\5\21\0>\5\1\4=\4\22\3>\3\1\2=\2\f\1K\0\1\0\18setupCommands\1\0\3\16description\27enable pretty printing\ttext\28-enable-pretty-printing\19ignoreFailures\1\fprogram\0\1\0\6\frequest\vlaunch\tname\16Launch file\ttype\vcppdbg\vMIMode\bgdb\bcwd\23${workspaceFolder}\19miDebuggerPath\17/usr/bin/gdb\1\0\0\1\3\0\0\6c\bcpp\18load_launchjs\19dap.ext.vscode\1\0\3\frequest\vlaunch\tname\vLaunch\ttype\vcppdbg\6c\19configurations\1\0\3\aid\vcppdbg\fcommandd/home/csamga/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7\ttype\15executable\vcppdbg\radapters\bdap\19setup_handlers\21ensure_installed\1\0\0\1\2\0\0\rcpptools\nsetup\19mason-nvim-dap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\2Ô\2\0\0\4\0\14\0\0176\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0015\2\6\0005\3\a\0=\3\b\2=\2\t\0015\2\n\0=\2\v\0015\2\f\0=\2\r\1B\0\2\1K\0\1\0\fendwise\1\0\1\venable\2\fautotag\1\0\1\venable\2\14highlight\fdisable\1\2\0\0\tmake\1\0\2&additional_vim_regex_highlighting\1\venable\2\21ensure_installed\1\0\2\17auto_install\2\17sync_install\1\1\r\0\0\6c\bcpp\tmake\blua\tjson\njson5\bvim\thelp\rsolidity\15javascript\thtml\bcss\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: vscode.nvim
time([[Config for vscode.nvim]], true)
try_loadstring("\27LJ\2\2ó\4\0\0\b\0 \0A6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0006\1\0\0009\1\3\0019\1\5\1'\2\6\0B\1\2\0A\0\0\2'\1\a\0)\2\b\0\3\2\0\0X\2\4€)\2\18\0\1\0\2\0X\2\1€'\1\b\0006\2\0\0009\2\1\2=\1\t\0026\2\n\0'\3\v\0B\2\2\0029\2\f\2B\2\1\0026\3\n\0'\4\r\0B\3\2\0029\3\14\0035\4\15\0004\5\0\0=\5\16\0045\5\20\0005\6\17\0009\a\18\2=\a\19\6=\6\21\0055\6\23\0009\a\22\2=\a\24\6=\6\25\5=\5\26\4B\3\2\1\a\1\a\0X\3\b€6\3\0\0009\3\27\0039\3\28\3)\4\0\0'\5\29\0005\6\30\0B\3\4\1X\3\a€6\3\0\0009\3\27\0039\3\28\3)\4\0\0'\5\29\0005\6\31\0B\3\4\1K\0\1\0\1\0\3\abg\tNONE\afg\f#a8a8a8\vitalic\2\1\0\3\abg\tNONE\afg\f#575757\vitalic\2\r@comment\16nvim_set_hl\bapi\20group_overrides\fComment\afg\1\0\2\abg\tNONE\vitalic\2\fvscGray\15MatchParen\1\0\0\abg\17vscSplitDark\1\0\1\afg\tNONE\20color_overrides\1\0\3\16transparent\1\20italic_comments\2\24disable_nvimtree_bg\1\nsetup\vvscode\15get_colors\18vscode.colors\frequire\15background\nlight\tdark\a%H\rstrftime\vstr2nr\afn\18termguicolors\6o\bvim\0", "config", "vscode.nvim")
time([[Config for vscode.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\2n\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\2#show_trailing_blankline_indent\1\tchar\bâ”†\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\2¾\a\0\0\6\0&\0‚\0016\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\0016\0\0\0'\1\3\0B\0\2\0026\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3\b\0009\4\t\0004\5\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3\n\0009\4\v\0004\5\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3\f\0009\4\r\0004\5\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3\14\0009\4\15\0004\5\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3\16\0009\4\17\0004\5\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3\18\0009\4\19\0004\5\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3\20\0009\4\21\0004\5\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3\22\0009\4\23\0004\5\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3\24\0009\4\25\0004\5\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3\26\0009\4\27\0004\5\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3\28\0009\4\29\0004\5\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3\30\0009\4\31\0004\5\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3 \0009\4!\0004\5\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3\"\0009\4#\0004\5\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\2\a\0'\3$\0009\4%\0004\5\0\0B\1\5\1K\0\1\0\fkeymaps\14<leader>k\30current_buffer_fuzzy_find\15<leader>bf\25lsp_type_definitions\15<leader>td\24lsp_implementations\15<leader>gi\15treesitter\15<leader>ts\16diagnostics\14<leader>d\14man_pages\15<leader>mp\25lsp_document_symbols\15<leader>ds\19lsp_references\15<leader>gr\20lsp_definitions\15<leader>gd\14help_tags\15<leader>fh\fbuffers\14<leader> \14live_grep\15<leader>fg\14git_files\15<leader>gf\15find_files\15<leader>ff\6n\bset\vkeymap\bvim\22telescope.builtin\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\2-\0\1\3\1\2\0\5-\1\0\0009\1\0\0019\2\1\0B\1\2\1K\0\1\0\1À\tbody\15lsp_expandš\1\0\1\2\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\v€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisible¢\1\0\1\3\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\2ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\2ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\19expand_or_jump\23expand_or_jumpable\21select_prev_item\fvisible„\4\1\0\t\0\"\0@6\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0029\2\3\0019\2\4\0024\3\0\0B\2\2\0019\2\4\0005\3\b\0005\4\6\0003\5\5\0=\5\a\4=\4\t\0039\4\n\0009\4\v\0049\4\f\0045\5\14\0009\6\n\0009\6\r\6)\aüÿB\6\2\2=\6\15\0059\6\n\0009\6\r\6)\a\4\0B\6\2\2=\6\16\0059\6\n\0009\6\17\0064\a\0\0B\6\2\2=\6\18\0059\6\n\0009\6\19\0065\a\22\0009\b\20\0009\b\21\b=\b\23\aB\6\2\2=\6\24\0059\6\n\0003\a\25\0005\b\26\0B\6\3\2=\6\27\0059\6\n\0003\a\28\0005\b\29\0B\6\3\2=\6\30\5B\4\2\2=\4\n\0034\4\3\0005\5\31\0>\5\1\0045\5 \0>\5\2\4=\4!\3B\2\2\0012\0\0€K\0\1\0\fsources\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\vconfig\fluasnip\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd lualine.nvim ]]

-- Config for: lualine.nvim
try_loadstring("\27LJ\2\2–\1\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\1B\0\2\1K\0\1\0\foptions\1\0\0\1\0\4\23section_separators\5\25component_separators\6|\18icons_enabled\1\ntheme\vvscode\nsetup\flualine\frequire\0", "config", "lualine.nvim")

vim.cmd [[ packadd nvim-autopairs ]]

-- Config for: nvim-autopairs
try_loadstring("\27LJ\2\2¼\1\0\0\a\0\t\0\0206\0\0\0'\1\1\0B\0\2\0029\1\2\0004\2\0\0B\1\2\0016\1\0\0'\2\3\0B\1\2\0026\2\0\0'\3\4\0B\2\2\0029\3\5\1\18\4\3\0009\3\6\3'\5\a\0009\6\b\2B\6\1\0A\3\2\1K\0\1\0\20on_confirm_done\17confirm_done\aon\nevent\"nvim-autopairs.completion.cmp\bcmp\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")

vim.cmd [[ packadd nvim-treesitter-textobjects ]]
vim.cmd [[ packadd nvim-ts-autotag ]]

-- Config for: nvim-ts-autotag
try_loadstring("\27LJ\2\2A\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0", "config", "nvim-ts-autotag")

time([[Sequenced loading]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
