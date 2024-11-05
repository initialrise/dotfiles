vim.opt.number=true
vim.g.mapleader=' '
vim.g.maplocalleader=' '
require("config.lazy")


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
-- nerdtree
-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- optionally enable 24-bit colour
vim.opt.termguicolors = true
-- nerdtree config
local nerdtree = require('nvim-tree.api')
vim.keymap.set('n', '<leader>e', nerdtree.tree.toggle, {})

-- vim.keymap.set('n', '<leader>e', "", {})
