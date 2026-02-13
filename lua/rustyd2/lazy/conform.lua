return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                javascript = { "prettier", stop_after_first = true },
                typescript = { "prettier", stop_after_first = true },
                html = { "prettier", stop_after_first = true },
                -- Add other file types as needed
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_format = "fallback",
            },
            opts = function(_, opts)
                opts.formatters_by_ft = opts.formatters_by_ft or {}
                for _, ft in ipairs(supported) do
                    opts.formatters_by_ft[ft] = opts.formatters_by_ft[ft] or {}
                    table.insert(opts.formatters_by_ft[ft], "prettier")
                end

                opts.formatters = opts.formatters or {}
                opts.formatters.prettier = {
                    condition = function(_, ctx)
                        return M.has_parser(ctx) and (vim.g.lazyvim_prettier_needs_config ~= true or M.has_config(ctx))
                    end,
                }
            end
        });
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function(args)
                require("conform").format({ bufnr = args.buf })
            end,
        })
    end
}
