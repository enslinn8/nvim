require("rustyd2.remap")
require("rustyd2.set")
require("rustyd2.lazy_init")
require("rustyd2.snippets")

-- Make the normal background transparent <- needs to run after lazy
vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
vim.api.nvim_set_hl(0, "NonText", { bg = "none", ctermbg = "none" })
