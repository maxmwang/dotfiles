return {
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        mappings = false,
      })
    end,
    keys = {
      {
        '<leader>/',
        function() require('Comment.api').toggle.linewise.current() end,
        desc = '[Comment] Comment current line',
      },
      {
        '<leader>/',
        '<ESC><cmd>lua require(\'Comment.api\').toggle.linewise(vim.fn.visualmode())<CR>',
        desc = '[Comment] Comment current selection',
        mode = { 'v' },
      },
    },
  },
}
