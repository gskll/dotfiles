return {
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
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
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
	},
}
