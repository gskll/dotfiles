local lsp = require("lsp-zero")
local lspconfig = require("lspconfig")

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"lua_ls",
	"gopls",
	"html",
	"cssls",
})

-- Fix Undefined global 'vim'
lsp.configure("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lspconfig.angularls.setup({
	on_attach = function(client)
		client.server_capabilities.renameProvider = false
	end,
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

local on_attach = function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
		vim.cmd("silent! wa")
	end, opts)

	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

	vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		vim.keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
		vim.keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports
		vim.keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables
	end

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
		on_attach = on_attach,
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
