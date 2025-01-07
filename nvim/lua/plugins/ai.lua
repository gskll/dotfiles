return {
	{
		"jackMort/ChatGPT.nvim",
		cmd = "ChatGPT",
		keys = {
			{ "<leader>C", "<cmd>ChatGPT<cr>", desc = "ChatGPT" },
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"folke/trouble.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("chatgpt").setup({
				popup_window = {
					border = {
						text = {
							top = " ? ",
						},
					},
				},
				api_key_cmd = "op read op://private/openai-key/credential --no-newline",
				openai_params = {
					model = "gpt-4-turbo-preview",
					frequency_penalty = 0,
					presence_penalty = 0,
					temperature = 0.2,
					top_p = 0.1,
					n = 1,
					max_tokens = 4095,
				},
				openai_edit_params = {
					model = "gpt-4-turbo-preview",
					frequency_penalty = 0,
					presence_penalty = 0,
					temperature = 0.2,
					top_p = 0.1,
					n = 1,
				},
			})
		end,
	},

	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- set this if you want to always pull the latest change
		opts = {
			-- add any opts here
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			-- "stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			-- "zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
}
