-- n, v, i, t = mode names
-- <C> - Ctrl
-- <S> - Shift
-- <A> - Alt

local map = require('utils.keys').map

local M = {}

local mappings = {
  { 'i', '<C-b>',     '<ESC>^i',         'Go to beginning of current line' },
  { 'i', '<C-e>',     '<End>',           'Go to end of current line' },
  { 'i', '<C-h>',     '<Left>',          'Move cursor left' },
  { 'i', '<C-l>',     '<Right>',         'Move cursor right' },
  { 'i', '<C-j>',     '<Down>',          'Move cursor down' },
  { 'i', '<C-k>',     '<Up>',            'Move cursor up' },
  { 'n', '<Esc>',     ':noh <CR>',       'Clear highlights' },
  { 'n', '<C-h>',     '<C-w>h',          'Focus window left' },
  { 'n', '<C-l>',     '<C-w>l',          'Focus window right' },
  { 'n', '<C-j>',     '<C-w>j',          'Focus window down' },
  { 'n', '<C-k>',     '<C-w>k',          'Focus window up' },
  { 'n', '<C-s>',     '<cmd> w <CR>',    'Save file' },
  { 'n', '<leader>b', '<cmd> enew <CR>', 'New buffer' },
}


for _, mapping in pairs(mappings) do
  map(mapping[1], mapping[2], mapping[3], mapping[4])
end
