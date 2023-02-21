local M = {}

function M.config()
  local autopairs = require('nvim-autopairs')
  autopairs.setup {}

	local cmp = require('cmp')
	local autopairs_cmp = require('nvim-autopairs.completion.cmp')
	cmp.event:on('confirm_done', autopairs_cmp.on_confirm_done())
end

return M
