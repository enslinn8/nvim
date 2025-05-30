vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--moves the entire block of hightlighted code
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


vim.keymap.set("n", "J", "mzJ1z")
--always center after search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--past without losing it
vim.keymap.set("x", "<learder>p", "\"_dP")

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
    vim.o.clipboard = 'unnamedplus'
end)


--l    local opts = { buffer = bufnr, remap = false }
local opts = { buffer = bufnr, remap = false }
vim.keymap.set('n', 'K', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', 'H', vim.lsp.buf.hover, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', '<leader>fd', vim.lsp.buf.format, opts)
vim.keymap.set('n', '<leader>fd', vim.lsp.buf.format, opts)
vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)

vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)

vim.keymap.set("n", "<leader>ee", function() vim.cmd('NvimTreeToggle') end, opts)
vim.keymap.set("n", "<leader>ef", function() vim.cmd('NvimTreeFindFile') end, opts)
vim.keymap.set("n", "<leader>ec", function() vim.cmd('NvimTreeCollapse') end, opts)
