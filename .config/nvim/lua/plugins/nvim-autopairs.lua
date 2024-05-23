return {
  {
    'windwp/nvim-autopairs',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-autopairs').setup({
        check_ts = true,
      })
    end,
    event = 'InsertEnter',
  },
}
