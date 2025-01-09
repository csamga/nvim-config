local spec = {
   'lukas-reineke/virt-column.nvim',
   event = 'BufWinEnter',
   opts = {
      char = '▏',
      virtcolumn = '81',
      highlight = 'VirtColumn'
   }
}

return spec
