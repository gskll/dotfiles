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
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		cmd = "Copilot",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
}
