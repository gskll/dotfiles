local lsp = require("lsp-zero").preset({})
local lspconfig = require("lspconfig")

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
local builtin = require("telescope.builtin")

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets/angular" } })

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

	vim.keymap.set("n", "gr", builtin.lsp_references, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
	vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
		vim.cmd("silent! wa")
	end, opts)
	vim.keymap.set("n", "<leader>fds", builtin.lsp_document_symbols, { desc = "Telescope lsp_document_symbols" })
	vim.keymap.set("n", "<leader>fws", builtin.lsp_workspace_symbols, { desc = "Telescope lsp_workspace_symbols" })

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

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- lspconfig.jsonls.setup({
-- 	capabilites = capabilities,
-- 	settings = {
-- 		json = {
-- 			schemas = require("schemastore").json.schemas(),
-- 			validate = { enable = true },
-- 		},
-- 	},
-- })

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

lspconfig.gopls.setup({
	cmd = { "gopls", "serve" },
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

cmp.setup({
	sources = {
		{ name = "copilot" },
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "buffer", keyword_length = 3 },
		{ name = "luasnip", keyword_length = 2 },
	},
	mapping = {
		["<C-f>"] = cmp_action.luasnip_jump_forward(),
		["<C-b>"] = cmp_action.luasnip_jump_backward(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}),
	},
})
