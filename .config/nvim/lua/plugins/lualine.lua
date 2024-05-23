local colors = {
  violet = '#cba6f7',
  red    = '#f38ba8',
  yellow = '#f9e2af',
  green  = '#a6e3a1',
  cyan   = '#89dceb',
  blue   = '#89b4fa',
  white  = '#cdd6f4',
  grey   = '#313244',
  black  = '#1E1E2E',
}

return {
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup({
        options = {
          globalstatus = true,
          icons_enabled = false,
          theme = {
            normal = {
              a = { fg = colors.black, bg = colors.violet },
              b = { fg = colors.white, bg = colors.grey },
              c = { fg = colors.black, bg = colors.black },
            },

            insert = { a = { fg = colors.black, bg = colors.blue } },
            visual = { a = { fg = colors.black, bg = colors.green } },
            replace = { a = { fg = colors.black, bg = colors.red } },
            command = { a = { fg = colors.black, bg = colors.yellow } },

            inactive = {
              a = { fg = colors.white, bg = colors.black },
              b = { fg = colors.white, bg = colors.black },
              c = { fg = colors.black, bg = colors.black },
            },
          },
          component_separators = '|',
          section_separators = { left = '', right = '' },
          ignore_focus = {
            'NvimTree'
          }
        },
        sections = {
          lualine_a = {
            {
              'mode',
              separator = { left = '' },
              padding = 1,
            },
          },
          lualine_b = { 'filename', 'branch' },
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {
            {
              'progress',
              separator = { left = '', right = '' },
              padding = 1,
            },
          },
        },
        inactive_sections = {
          lualine_a = { 'filename' },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { 'progress' },
        },
        tabline = {},
        extensions = {},
      })
    end,
  }
}
