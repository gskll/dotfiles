return {
	{
		"nvim-neotest/neotest",
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
			require("neotest").setup({
				adapters = {
					require("neotest-python"),
					require("neotest-phpunit"),
					require("neotest-go")({
						experimental = { test_table = true },
						recursive_run = true,
						args = { "-count=1", "-timeout=60s" },
					}),
				},
				status = { virtual_text = true },
				output = { open_on_run = true },
				quickfix = {
					open = function()
						if require("lazy.plugins.trouble") ~= nil then
							require("trouble").open({ mode = "quickfix", focus = false })
						else
							vim.cmd("copen")
						end
					end,
				},
			})
			local neotest_ns = vim.api.nvim_create_namespace("neotest")
			vim.diagnostic.config({
				virtual_text = {
					format = function(diagnostic)
						local message =
							diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
						return message
					end,
				},
			}, neotest_ns)
		end,
        -- stylua: ignore
		keys = {
			{ "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Neotest: Run File" },
			{ "<leader>tc", function() require("neotest").run.run(vim.fn.getcwd()) end, desc = "Neotest: Run All Test Files" },
			{ "<leader>tt", function() require("neotest").run.run() end, desc = "Neotest: Run Nearest" },
			{ "<leader>tl", function() require("neotest").run.run_last() end, desc = "Neotest: Run Last" },
            {"<leader>td", function() require("neotest").run.run({strategy = "dap"}) end, desc = "Neotest: Debug test"},
			{ "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Neotest: Toggle Summary" },
			{ "<leader>tu", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Neotest: Show Output" },
			{ "<leader>tU", function() require("neotest").output_panel.toggle() end, desc = "Neotest: Toggle Output Panel" },
			{ "<leader>tS", function() require("neotest").run.stop() end, desc = "Neotest: Stop" },
            {"[n", function() require("neotest").jump.prev({status="failed"}) end, desc="Neotest: go to prev failed test"},
            {"]n", function() require("neotest").jump.next({status="failed"}) end, desc="Neotest: go to next failed test"}
		},
	},
}
