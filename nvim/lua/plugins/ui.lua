return {
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		keys = {
			{
				"<leader>sm",
				function()
					require("zen-mode").toggle()
				end,
				"Toggle zen mode",
			},
		},
		opts = {},
	},
	{
		"echasnovski/mini.statusline",
		event = "",
		version = "*",
		config = function()
			require("mini.statusline").setup()
		end,
	},
}