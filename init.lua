local utils = require('config.utils')
utils.set_background({ min = 10, max = 16 })
vim.cmd.language('en')

require('config.lazy')
require('config.theme')
require('config.autocmds')
require('config.options')
require('config.keymaps')
require('config.diagnostics')
