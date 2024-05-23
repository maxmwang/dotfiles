return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
    },
    config = function()
      require('telescope').load_extension('fzf')
    end,
    keys = {
      {
        '<leader>ff',
        require('telescope.builtin').find_files,
        desc = '[Telescope]: Find files',
      },
      {
        '<leader>fw',
        require('telescope.builtin').live_grep,
        desc = '[Telescope]: Find words',
      },
      {
        '<leader>fz',
        require('telescope.builtin').current_buffer_fuzzy_find,
        desc = '[Telescope]: Find in file',
      },
      {
        '<leader>fk',
        require('telescope.builtin').keymaps,
        desc = '[Telescope]: Find keymaps',
      },
      {
        '<leader>ft',
        require('telescope.builtin').pickers,
        desc = '[Telescope]: Find pickers',
      },
    },
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    lazy = true,
  },
}
