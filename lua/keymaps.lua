vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.wo.number = true
vim.cmd("colorscheme duskfox")

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Ttransparent screen
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
