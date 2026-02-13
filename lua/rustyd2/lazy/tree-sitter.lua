return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter")

        treesitter.setup({
            ensure_installed = { "lua", "vimdoc", "query", "javascript", "html" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,
        })
    end
}
