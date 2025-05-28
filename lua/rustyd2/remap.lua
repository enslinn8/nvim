vim.g.mapleader = " "

vim.keymap.set("n","<leader>pv",vim.cmd.Ex)

--moves the entire block of hightlighted code
vim.keymap.set("v","J",":m '>+1<CR>gv=gv")
vim.keymap.set("v","K",":m '<-2<CR>gv=gv")


vim.keymap.set("n","J","mzJ1z")
--always center after search
vim.keymap.set("n","n","nzzzv") 
vim.keymap.set("n","N","Nzzzv")

--past without losing it
vim.keymap.set("x","<learder>p","\"_dP")



