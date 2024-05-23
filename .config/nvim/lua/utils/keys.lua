local M = {}

--------------------------------------
--- creates a keybinding
--- @param mode string | table represents the mode(s) in which keybind is active
--- @param lhs string the keybinding
--- @param rhs string the action to be performed
--- @param desc? string the description of the keybinding
--------------------------------------
M.map = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

M.lsp_map = function(lhs, rhs, bufnr, desc)
  vim.keymap.set("n", lhs, rhs, { silent = true, buffer = bufnr, desc = desc })
end

--------------------------------------
--- creates the leader key, referenced throughout as \<leader\>
--- @param key string the leader key
--------------------------------------
M.set_leader = function(key)
  vim.g.mapleader = key
  vim.g.maplocalleader = key
  M.map({ "n", "v" }, key, "<nop>")
end

return M
