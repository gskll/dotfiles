local lsp = require("lsp-zero").preset({
	name = "recommended",
	manage_nvim_cmp = {
		set_extra_mappings = true,
	},
})
local lspconfig = require("lspconfig")

lsp.ensure_installed({
	"tsserver",
	"lua_ls",
	"gopls",
	"html",
	"cssls",
	"angularls",
	"emmet_ls",
})

local on_attach = function(_, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
	vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
		vim.cmd("silent! wa")
	end, opts)

	-- show line diagnostics automatically in hover window
	-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#show-line-diagnostics-automatically-in-hover-window
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local cursorHoldOpts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = "rounded",
				source = "always",
				prefix = " ",
				scope = "cursor",
			}
			vim.diagnostic.open_float(nil, cursorHoldOpts)
		end,
	})
end

lsp.on_attach(on_attach)

lspconfig.angularls.setup({
	on_attach = function(client)
		client.server_capabilities.renameProvider = false
	end,
})

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

lspconfig.gopls.setup({
	on_attach = on_attach,
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
		},
	},
})

lsp.skip_server_setup({ "tsserver" })
lsp.setup()

require("typescript").setup({
	server = {
		on_attach = function()
			vim.keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
			vim.keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports
			vim.keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables
		end,
		on_init = function(client)
			client.server_capabilities.semanticTokensProvider = nil
		end,
	},
})

vim.diagnostic.config({
	virtual_text = false,
})

vim.api.nvim_create_autocmd("DiagnosticChanged", {
	callback = function()
		vim.diagnostic.setloclist({ open = false })
	end,
})
