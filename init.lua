local utils = require('config.utils')
utils.set_background({ min = 10, max = 17 })

if (vim.loop.os_uname().sysname ~= 'Linux') then
   vim.cmd.language('en')
end

require('config.lazy')
require('config.theme')
require('config.autocmds')
require('config.options')
require('config.keymaps')
require('config.diagnostics')
