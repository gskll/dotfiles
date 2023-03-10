-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

require("mason").setup()
require("mason-null-ls").setup({
	ensure_installed = {
		"stylua",
		"prettierd",
		"eslint_d",
	},
	automatic_installation = false,
	automatic_setup = true,
})
require("null-ls").setup({
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

require("mason-null-ls").setup_handlers()
