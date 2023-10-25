-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- file navigation
	use("theprimeagen/harpoon") -- file navigation
	use("tpope/vim-vinegar") -- sensible netrw defaults
	use("tpope/vim-sleuth") -- detect indentation
	use({ -- fuzzy finding files
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- appearance
	use({ "ellisonleao/gruvbox.nvim" }) -- colorscheme
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	-- treesitter configuration
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "nvim-treesitter/nvim-treesitter-textobjects" })
	use("nvim-treesitter/playground")
	use({ "elgiano/nvim-treesitter-angular", branch = "topic/jsx-fix" })
	use("nvim-treesitter/nvim-treesitter-context")

	-- file utils
	use({ "sitiom/nvim-numbertoggle" }) -- switch number style based on mode
	use("mbbill/undotree") -- file/undo history visualizer
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup()
		end,
	})
	-- git integration
	use("tpope/vim-fugitive") -- git support
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	-- language server
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{
				-- Optional
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	})
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use({ "joeveiga/ng.nvim" })
	use({ "b0o/schemastore.nvim" })

	-- Snippets
	use({
		"L3MON4D3/LuaSnip",
		after = "nvim-cmp",
		tag = "v1.*",
		run = "make install_jsregexp",
	})
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	use("eandrju/cellular-automaton.nvim") -- fml

	-- comments
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- debugging
	use("mfussenegger/nvim-dap")
	use({
		"leoluz/nvim-dap-go",
		requires = { "mfussenegger/nvim-dap" },
	})
	use({ "jay-babu/mason-nvim-dap.nvim" })

	use({
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({ use_diagnostic_signs = true })
		end,
	})

	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup()
		end,
	})

	use("szw/vim-maximizer") -- maximizes and restores current window

	use("laytan/cloak.nvim") -- hide sensitive information

	use({
		"zbirenbaum/copilot.lua",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	})
	use({
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	})

	use({
		"folke/persistence.nvim",
		event = "BufReadPre",
		module = "persistence",
		config = function()
			require("persistence").setup()
		end,
	})

	use({
		"olexsmir/gopher.nvim",
		requires = { -- dependencies
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("gopher").setup()
		end,
	})
end)
