return {
  -- util libraries
  {
    'nvim-lua/plenary.nvim',
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },
  -- git
  {
    'lewis6991/gitsigns.nvim',
  },
}
