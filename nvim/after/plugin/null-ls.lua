local mason = require("mason")
local mason_null_ls = require("mason-null-ls")
local null_ls = require("null-ls")
-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

mason.setup()
mason_null_ls.setup({
	ensure_installed = {
		"stylua",
		"prettierd",
		"eslint_d",
		"gofumpt",
		"golines",
		"goimports-reviser",
	},
	automatic_installation = false,
	automatic_setup = true,
	handlers = {
		golines = function()
			null_ls.register(null_ls.builtins.formatting.golines.with({ args = { "-m", "120", "-t", "1" } }))
		end,
	},
})
null_ls.setup({
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
