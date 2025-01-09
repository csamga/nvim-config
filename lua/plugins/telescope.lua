local options = function()
   local actions = require('telescope.actions')

   return {
      defaults = require('telescope.themes').get_dropdown({
         mappings = {
            i = {
               ['<C-j>'] = actions.preview_scrolling_down,
               ['<C-k>'] = actions.preview_scrolling_up,
            },
            n = {
               ['<C-j>'] = actions.preview_scrolling_down,
               ['<C-k>'] = actions.preview_scrolling_up,
               ['q'] = actions.close,
            },
         },
         preview = {
            check_mime_type = true,
         },
         dynamic_preview_title = true,
      }),
      pickers = {
         live_grep = {
            disable_coordinates = true,
         },
         man_pages = {
            sections = { 'ALL' },
            -- man_cmd = {'C:\\msys64\\usr\\bin\\apropos.exe', ''},
         },
      },
      extensions = {
         ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
         },
         ['file_browser'] = {
            hijack_netrw = true,
         },
      },
   }
end

local config = function(_, opts)
   local telescope = require('telescope')
   local builtin = require('telescope.builtin')
   local extensions = require('telescope').extensions

   vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
   vim.keymap.set('n', '<leader>gr', builtin.live_grep, { desc = 'Telescope live grep' })
   vim.keymap.set('n', '<leader>bf', builtin.buffers, { desc = 'Telescope buffers' })
   vim.keymap.set('n', '<leader>ht', builtin.help_tags, { desc = 'Telescope help tags' })
   vim.keymap.set('n', '<leader>mp', builtin.man_pages, { desc = 'Telescope man pages' })
   vim.keymap.set('n', '<leader>fb', extensions.file_browser.file_browser, { desc = 'Telescope file browser' })

   telescope.setup(opts)
   telescope.load_extension('file_browser')
   telescope.load_extension('fzf')
   telescope.load_extension('ui-select')
end

local spec = {
   'nvim-telescope/telescope.nvim',
   tag = '0.1.8', -- or: branch = '0.1.x',
   dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-ui-select.nvim',
   },
   event = 'BufWinEnter',
   opts = options,
   config = config,
}

return spec
