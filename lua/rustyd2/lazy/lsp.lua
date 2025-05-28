local custom_attach = function()
    print('Custom attach trigger')
end

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies={
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
        },
        config = function()
            require("mason-lspconfig").setup({
                automatic_enable = true,
                ensure_installed = {
                    "lua_ls",
                    "eslint",
                    "angularls",
                },
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({
                            on_attach = custom_attach,
                        })
                    end,
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require('lspconfig')

            lspconfig.lua_ls.setup ({})
            lspconfig.eslint.setup ({})
        end
    }
}
