local plugins = {
	"nvim-lua/plenary.nvim",
	"tpope/vim-sleuth",
	"theprimeagen/harpoon",
	"eandrju/cellular-automaton.nvim",
	"mbbill/undotree",
	"windwp/nvim-ts-autotag",
	"szw/vim-maximizer",
	"laytan/cloak.nvim",

	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("core.utils").set_colorscheme()
		end,
	},
	{
		"folke/tokyonight.nvim",
		opts = {
			style = "storm",
			terminal_colors = true,
			styles = {
				comments = { italic = false },
				keywords = { italic = false },
				sidebars = "dark",
				floats = "dark",
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		opts = function()
			return require("plugins.configs.treesitter")
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		enabled = true,
		opts = { mode = "cursor", max_lines = 3 },
	},
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function(_, opts)
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.surround").setup({ n_lines = 500 })
			require("mini.comment").setup()
			require("mini.pairs").setup()
		end,
	},

	-- vim vinegar - just replace?
	-- vim - sleuth ??
	--
	-- telescope
	-- colorscheme - gruvbox
	-- lualine
	-- treesitter
	-- lsp
	--
	-- debugging
	-- formatting
	-- git
	-- lsp
	-- copilot
}
