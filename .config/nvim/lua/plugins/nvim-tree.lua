return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('nvim-tree').setup({
        disable_netrw = true,
        hijack_cursor = true,
        view = {
          width = 30,
          hide_root_folder = false,
          float = {
            enable = true,
            quit_on_focus_loss = true,
            open_win_config = {
              height = 45,
            },
          },
        },
        renderer = {
          root_folder_label = function(path)
            local project = vim.fn.fnamemodify(path, ":t")
            return string.upper(project)
          end,
          icons = {
            show = {
              folder_arrow = false,
            },
          },
          indent_markers = {
            enable = true,
          },
        },
        filters = {
          dotfiles = true,
        },
        update_focused_file = {
          enable = true,
        },
        actions = {
          open_file = {
            quit_on_open = true,
          }
        },
      })
    end,
    keys = {
      {
        '<leader>e',
        '<cmd> NvimTreeToggle <CR>',
        desc = '[Nvim-Tree] Toggle file explorer',
      },
    },
  },
}
