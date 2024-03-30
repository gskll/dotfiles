return {
	{
		"nvim-neotest/neotest",
		keys = { "<leader>tt", "<leader>tf", "<leader>td", "<leader>tc", "<leader>ts" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neotest/nvim-nio",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",

			"nvim-neotest/neotest-go",
			"nvim-neotest/neotest-python",
			"olimorris/neotest-phpunit",
		},
		config = function()
			local neotest = require("neotest")
			neotest.setup({
				adapters = {
					require("neotest-go"),
					require("neotest-python"),
					require("neotest-phpunit"),
				},
			})

			vim.keymap.set("n", "<leader>tt", neotest.run.run, { desc = "Run nearest test" })
			vim.keymap.set("n", "<leader>tf", function()
				neotest.run.run(vim.fn.expand("%"))
			end, { desc = "Run current file" })
			vim.keymap.set("n", "<leader>tc", function()
				neotest.run.run(vim.fn.getcwd())
			end, { desc = "Run current file" })
			vim.keymap.set("n", "<leader>td", function()
				neotest.run.run({ strategy = "dap" })
			end, { desc = "Debug nearest test" })
			vim.keymap.set("n", "<leader>tx", neotest.run.stop, { desc = "Neotest: Stop test run" })
			vim.keymap.set("n", "<leader>ts", neotest.summary.toggle, { desc = "Neotest: Toggle summary panel" })
			vim.keymap.set("n", "<leader>tv", neotest.output_panel.toggle, { desc = "Neotest: Toggle output panel" })
			vim.keymap.set("n", "[n", function()
				neotest.jump.prev({ status = "failed" })
			end, { desc = "Neotest: Jump prev failed test" })
			vim.keymap.set("n", "]n", function()
				neotest.jump.next({ status = "failed" })
			end, { desc = "Neotest: Jump next failed test" })
		end,
	},
}
