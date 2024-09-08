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
			log_level = vim.log.levels.DEBUG,
			notify_on_error = true,
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				sh = { "shfmt" },
				go = { "goimports-reviser", "gofumpt", "golines" },

				javascript = { "prettierd", "prettier" },
				typescript = { "prettierd", "prettier" },
				json = { "prettierd", "prettier" },
				markdown = { "prettierd", "prettier" },
				html = { "prettierd", "prettier" },
				css = { "prettierd", "prettier" },
				scss = { "prettierd", "prettier" },
			},
			formatters = {
				injected = { options = { ignore_errors = false } },
				golines = { prepend_args = { "-m", "120", "-t", "1" } },
			},
		},
	},
}
