return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup({
        open_mapping = '<C-`>',
        direction = 'float',
        float_opts = {
          border = 'curved',
        },
        persist_size = true,
        persist_mode = true,
        close_on_exit = true,
        insert_mapings = true,
      })
    end,
    keys = {
      {
        '<C-`>',
        '<cmd> ToggleTerm <CR>',
        desc = '[ToggleTerm] Toggle floating terminal',
      },
    }
  }
}
