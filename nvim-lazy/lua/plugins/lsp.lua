return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile", "BufWritePre" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
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
				map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
				map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
				map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				map("K", vim.lsp.buf.hover, "Hover Documentation")
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				map("<leader>rn", function()
					vim.lsp.buf.rename()
					vim.cmd("silent! wa")
				end, "[R]e[n]ame")

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
				vim.api.nvim_create_autocmd("CursorHold", {
					buffer = event.buf,
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
						runtime = { version = "LuaJIT" },
						workspace = {
							checkThirdParty = false,
							library = {
								"${3rd}/luv/library",
								unpack(vim.api.nvim_get_runtime_file("", true)),
							},
						},
						completion = {
							callSnippet = "Replace",
						},
						diagnostics = {
							disable = { "missing-fields" },
							globals = { "vim", "it", "describe", "before_each", "after_each" },
						},
					},
				},
			},
		}

		require("mason").setup()

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"json-to-struct",
			"gofumpt",
			"golines",
			"gotests",
			"golangci-lint",
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

		-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
		--
		-- cmp.setup({
		-- 	snippet = {
		-- 		expand = function(args)
		-- 			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		-- 		end,
		-- 	},
		-- 	mapping = cmp.mapping.preset.insert({
		-- 		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		-- 		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		-- 		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		-- 		["<C-Space>"] = cmp.mapping.complete(),
		-- 	}),
		-- 	sources = cmp.config.sources({
		-- 		{ name = "nvim_lsp" },
		-- 		{ name = "luasnip" }, -- For luasnip users.
		-- 	}, {
		-- 		{ name = "buffer" },
		-- 	}),
		-- })

		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}
