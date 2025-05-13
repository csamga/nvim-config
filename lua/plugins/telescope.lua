local options = function()
   local actions = require('telescope.actions')

   return {
      defaults = require('telescope.themes').get_dropdown({
         winblend = 10,
         layout_config = {
            anchor = 'N',
            width = function(_, max_columns, _)
               return math.min(max_columns, 82)
            end,
            height = require('telescope.config.resolve').resolve_height({
               0.55, min = 14
            })
         },
         file_ignore_patterns = { '%.o', '%.d' },
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
         find_files = {
            no_ignore = true,
         },
         live_grep = {
            disable_coordinates = true,
         },
         buffers = {
            ignore_current_buffer = true,
            sort_lastused = true,
            sort_mru = true,
         },
         man_pages = {
            sections = { 'ALL' },
         },
      },
      extensions = {
         ['ui-select'] = {
            require('telescope.themes').get_dropdown({
               layout_config = {
                  anchor = 'CENTER'
               }
            }),
         },
         ['file_browser'] = {
            hijack_netrw = true,
            hidden = true,
            grouped = true,
            collapse_dirs = true,
            select_buffer = true,
            display_stat = { mode = true },
            prompt_path = true,
            theme = 'ivy',
         },
      },
   }
end

local config = function(_, opts)
   local telescope = require('telescope')
   local builtin = require('telescope.builtin')
   local extensions = require('telescope').extensions

   telescope.setup(opts)
   telescope.load_extension('file_browser')
   telescope.load_extension('fzf')
   -- telescope.load_extension('ui-select')

   vim.keymap.set('n', '<leader>ff', builtin.find_files, {
      desc = 'Telescope find files'
   })
   vim.keymap.set('n', '<leader>gr', builtin.live_grep, {
      desc = 'Telescope live grep'
   })
   vim.keymap.set('n', '<leader>bf', builtin.buffers, {
      desc = 'Telescope buffers'
   })
   vim.keymap.set('n', '<leader>ht', builtin.help_tags, {
      desc = 'Telescope help tags'
   })
   vim.keymap.set('n', '<leader>mp', builtin.man_pages, {
      desc = 'Telescope man pages'
   })
   vim.keymap.set('n', '<leader>fb', extensions.file_browser.file_browser, {
      desc = 'Telescope file browser'
   })
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
