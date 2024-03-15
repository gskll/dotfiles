return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{
				"nvim-treesitter/nvim-treesitter-context",
				enabled = true,
				opts = { mode = "cursor", max_lines = 3 },
			},
		},
		config = function()
			require("nvim-treesitter.configs").setup({

				ensure_installed = {
					"vim",
					"vimdoc",
					"javascript",
					"typescript",
					"go",
					"rust",
					"python",
					"php",
					"c",
					"lua",
					"query",
					"fish",
					"json",
					"html",
					"css",
					"scss",
					"tsx",
					"yaml",
					"markdown",
					"markdown_inline",
					"graphql",
					"bash",
					"gitignore",
					"dockerfile",
				},
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					use_languagetree = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
				autotag = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<c-space>",
						node_incremental = "<c-space>",
						scope_incremental = "<c-s>",
						node_decremental = "<S-space>",
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							["]m"] = "@function.outer",
							["]]"] = "@class.outer",
						},
						goto_next_end = {
							["]M"] = "@function.outer",
							["]["] = "@class.outer",
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
							["[["] = "@class.outer",
						},
						goto_previous_end = {
							["[M"] = "@function.outer",
							["[]"] = "@class.outer",
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>m"] = "@parameter.inner",
						},
						swap_previous = {
							["<leader>M"] = "@parameter.inner",
						},
					},
				},
			})
		end,
	},
}
