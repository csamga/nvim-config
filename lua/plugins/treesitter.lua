local spec = {
   'nvim-treesitter/nvim-treesitter',
   dependencies = { 'RRethy/nvim-treesitter-endwise' },
   build = ':TSUpdate',
   event = 'BufEnter',
   main = 'nvim-treesitter.configs',
   opts = {
      ensure_installed = {
         'lua', 'c', 'cpp', 'glsl', 'html', 'css', 'javascript'
      },
      highlight = {
         enable = true,
         disable = { 'help' }
      },
      indent = { enable = true },
      endwise = { enable = true }
   }
}

return spec
