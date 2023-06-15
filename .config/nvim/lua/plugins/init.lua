return {
  -- util librarie
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
    config = function() require('gitsigns').setup() end,
  },
  -- catppuccino theme
  {
    'catppuccin/nvim',
    config = function() vim.cmd.colorscheme('catppuccin-mocha') end,
  },
}
