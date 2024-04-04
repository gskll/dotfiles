return {
	{
		"stevearc/conform.nvim",
		dependencies = { "mason.nvim" },
		event = "BufWritePre",
		cmd = "ConformInfo",
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
			{
				"<leader>cF",
				function()
					require("conform").format({ formatters = { "injected" } })
				end,
				mode = { "n", "v" },
				desc = "Format Injected Langs",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				javascript = { { "prettierd", "prettier" } },
				sh = { "shfmt" },
				go = { "goimports", "gofumpt", "golines" },
				markdown = { { "prettierd", "prettier" } },
			},
			formatters = {
				injected = { options = { ignore_errors = false } },
			},
		},
	},
}
