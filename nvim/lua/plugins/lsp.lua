return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile", "BufWritePre" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
	},

	config = function()
		local lspAttachGroup = vim.api.nvim_create_augroup("LspAttachGroup", { clear = true })
		vim.api.nvim_create_autocmd("LspAttach", {
			group = lspAttachGroup,
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end
				map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
				map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
				map("gD", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
				map("gs", require("telescope.builtin").lsp_document_symbols, "Document symbols")
				map("gS", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")
				map("g.", vim.lsp.buf.code_action, "Code action")
				map("K", vim.lsp.buf.hover, "Hover Documentation")
				map("<leader>gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				map("cd", function()
					vim.lsp.buf.rename()
					vim.cmd("silent! wa")
				end, "Rename: [C]hange [d]efinition")

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.clear_references,
					})
				end
				vim.api.nvim_create_autocmd("DiagnosticChanged", {
					callback = function()
						vim.diagnostic.setloclist({ open = false })
					end,
				})
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		local servers = {
			["bash-language-server"] = {},
			clangd = {},
			gopls = {},
			pyright = {},
			rust_analyzer = {},
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							disable = { "missing-fields" },
							globals = { "vim", "it", "describe", "before_each", "after_each" },
						},
					},
				},
			},
			ts_ls = {
				cmd = {
					"/Users/andrew.gaskell/.asdf/installs/nodejs/20.15.0/bin/node",
					"/Users/andrew.gaskell/.local/share/nvim/mason/bin/typescript-language-server",
					"--stdio",
				},
			},
		}

		require("mason").setup()

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua",
			"json-to-struct",
			"gofumpt",
			"goimports-reviser",
			"golines",
			"gotests",
			"golangci-lint",
			"prettierd",
			"shfmt",
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})

		vim.diagnostic.config({
			virtual_text = true,
			float = {
				focusable = true,
				focus = true,
				style = "minimal",
				border = "rounded",
				source = "always",
				prefix = " ",
				header = "",
				scope = "cursor",
			},
		})
	end,
}
