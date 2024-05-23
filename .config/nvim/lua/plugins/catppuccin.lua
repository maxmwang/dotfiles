return {
  {
    'catppuccin/nvim',
    config = function()
      require('catppuccin').setup({
        integrations = {
          gitsigns = true,
          nvimtree = {
            enabled = true,
          },
          telescope = {
            enabled = true,
          },
        },
      })

      vim.cmd.colorscheme('catppuccin-mocha')
    end,
    priority = 1000,
  },
}
