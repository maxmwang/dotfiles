-- main neovim documentation here: https://neovim.io/doc/user/options.html

local g = vim.g
local opt = vim.opt

local options = {
  -- line numbers
  number = true,             -- show line numbers
  numberwidth = 3,           -- set number column width
  relativenumber = true,     -- show relative line numbers
  cursorline = true,         -- highlight current line (required for cursorlineopt)
  cursorlineopt = 'number',  -- highlight current line number
  -- sign column
  signcolumn = 'yes',        -- always show sign column
  -- indenting
  expandtab = true,          -- use spaces instead of tabs
  shiftwidth = 2,            -- number of spaces to use for autoindenting
  smartindent = true,        -- autoindent new lines
  tabstop = 2,               -- number of spaces a tab counts for
  softtabstop = 2,           -- number of spaces a tab counts for while performing editing operations
  shiftround = true,         -- round indent to multiple of shiftwidth
  -- searching
  ignorecase = true,         -- ignore case when searching
  smartcase = true,          -- ignore case if search pattern is all lowercase, case-sensitive otherwise
  -- window settings
  wrap = false,              -- don't wrap lines
  splitbelow = true,         -- force all horizontal splits to go below current window
  splitright = true,         -- force all vertical splits to go to the right of current window
  scrolloff = 8,             -- minimal number of screen lines to keep above and below the cursor
  sidescrolloff = 8,         -- minimal number of screen lines to keep left and right of the cursor.
  -- status line
  showmode = false,          -- hide mode indicator
  ruler = false,             -- hide cursor position on status line
  -- misc
  clipboard = 'unnamedplus', -- use system clipboard
  mouse = 'a',               -- enable mouse support for all modes
  updatetime = 100,          -- update frequency
  undofile = true,           -- enable persistent undo
  termguicolors = true,      -- enable 24-bit RGB colors, recommended for nvim-tree
}

for k, v in pairs(options) do
  opt[k] = v
end

opt.whichwrap:append('<>[]hl') -- move to next line with these keys

-- configs for nvim-tree
g.loaded_netwr = 1
g.loaded_netwrPlugin = 1
