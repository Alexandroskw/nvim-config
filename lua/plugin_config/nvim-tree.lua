vim.g.loaded_newtrw = 1
vim.g.loaded_newtrwPlugin = 1

require("nvim-tree").setup()

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
vim.keymap.set('n', '<c-f>', ':NvimTreeFocus<CR>')
