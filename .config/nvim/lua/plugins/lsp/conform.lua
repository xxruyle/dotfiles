return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					cpp = { "clang-format" },
					c = { "clang-format" },
					-- Conform will run multiple formatters sequentially
					python = { "black" },
					-- -- You can customize some of the format options for the filetype (:help conform.format)
					-- rust = { "rustfmt", lsp_format = "fallback" },
					-- -- Conform will run the first available formatter
					-- javascript = { "prettier", stop_after_first = true },
					javascript = { "prettier" },
					-- java = { "jdtls" },
					-- glsl = { "clang-format" },
					html = { "prettier" },
					-- htmldjango = { "prettier" },
					-- htmlangular = { "prettier" },
					bash = { "beautysh" },
				},
				format_on_save = function(bufnr)
					-- Disable with a global or buffer-local variable
					if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
						return
					end
					return { timeout_ms = 500, lsp_format = "fallback" }
				end,
			})
		end,
	},
}
