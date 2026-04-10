return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			require("conform").setup({
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run the first available formatter
					javascript = { "prettier" },
					typescript = { "prettier" },
					html = { "prettier" },
					htmlangular = { "prettier" },
				},
				formatters = {
					prettier = {
						-- Only run if a config file is found in the project
						require_cwd = true,
						-- Define which files count as a "config"
						cwd = require("conform.util").root_file({
							".prettierrc",
							".prettierrc.json",
							".prettierrc.yml",
							".prettierrc.yaml",
							".prettierrc.json5",
							".prettierrc.js",
							".prettierrc.cjs",
							".prettierrc.mjs",
							".prettierrc.toml",
							"prettier.config.js",
							"prettier.config.cjs",
							"prettier.config.mjs",
							"package.json", -- optional: prettier can be configured in package.json
						}),
					},
				},
			}),
		})
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
