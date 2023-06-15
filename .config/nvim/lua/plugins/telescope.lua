return {
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = 'nvim-lua/plenary.nvim',
    build = function()
      require('telescope').load_extension('fzf')
    end,
    keys = {
      {
        '<leader>ff',
        '<cmd> Telescope find_files <CR>',
        desc = 'Find files',
      },
      {
        '<leader>fw',
        '<cmd> Telescope live_grep <CR>',
        desc = 'Find words',
      },
      {
        '<leader>fz',
        '<cmd> Telescope current_buffer_fuzzy_find <CR>',
        desc = 'Find in current buffer',
      },
    },
  },
}
