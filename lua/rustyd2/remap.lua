vim.g.mapleader = " "
vim.keymap.set("n","<leader>pv",vim.cmd.Ex)


vim.keymap.set("v","J",":m '>+1<CR>gv=gv")
vim.keymap.set("v","K",":m '<-2<CR>gv=gv")


vim.keymap.set("n","J","mzJ1z")
vim.keymap.set("n","n","nzzzv")
vim.keymap.set("n","N","Nzzzv")

vim.keymap.set("x","<learder>p","\"_dP")



