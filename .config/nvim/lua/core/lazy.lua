local icons = require('core.icons')

-- initial setup
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- use a protected call so we don't error out on first use
local ok, lazy = pcall(require, 'lazy')
if not ok then
  return
end

-- we have to set the leader key here for lazy.nvim to work
require('utils.keys').set_leader(' ')

-- load plugins from specifications
-- (the leader key must be set before this)
lazy.setup('plugins', {
  concurrency = 4,
  ui = {
    border = "rounded",
    icons = {
      lazy = icons.widget.lazy .. "  ",
      not_loaded = icons.widget.inactive,
      loaded = icons.widget.active,
      task = icons.widget.task,
      source = icons.widget.source,
      start = icons.widget.start,
      plugin = icons.widget.plugin,
      event = icons.widget.event,
      keys = icons.widget.keymap,
      cmd = icons.widget.command,
      ft = icons.widget.filetype,
      init = icons.widget.config,
      runtime = icons.widget.runtime,
      import = icons.widget.import,
      config = icons.widget.config,
      list = {
        icons.layout.list,
        icons.layout.list,
        icons.layout.list,
        icons.layout.list,
      },
    },
  },
})

-- might as well set up an easy-access keybinding
require('utils.keys').map('n', '<leader>l', lazy.show, '[Lazy] Show Lazy')
