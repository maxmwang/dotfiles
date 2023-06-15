-- main neovim documentation here: https://neovim.io/doc/user/options.html

local g = vim.g
local opt = vim.opt

-- line numbers
opt.number = true            -- show line numbers
opt.numberwidth = 3          -- set number column width
opt.relativenumber = true    -- show relative line numbers
opt.cursorline = true        -- highlight current line
opt.cursorlineopt = 'number' -- highlight current line number
opt.ruler = false            -- hide cursor position on status line

-- sign column
opt.signcolumn = 'yes' -- always show sign column

-- indenting
opt.expandtab = true   -- use spaces instead of tabs
opt.shiftwidth = 2     -- number of spaces to use for autoindenting
opt.smartindent = true -- autoindent new lines
opt.tabstop = 2        -- number of spaces a tab counts for
opt.softtabstop = 2    -- number of spaces a tab counts for while performing editing operations

-- searching
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true  -- ignore case if search pattern is all lowercase, case-sensitive otherwise

-- window settings
opt.wrap = false -- don't wrap lines

-- status line
opt.showmode = false          -- hide mode indicator

opt.clipboard = 'unnamedplus' -- use system clipboard

opt.mouse = 'a'               -- enable mouse support for all modes

opt.updatetime = 500          -- update frequency

opt.undofile = true           -- enable persistent undo

opt.whichwrap:append "<>[]hl" -- move to next line with these keys

-- configs for nvim-tree
g.loaded_netwr = 1
g.loaded_netwrPlugin = 1
opt.termguicolors = true -- enable 24-bit RGB colors

require('core.keys')
