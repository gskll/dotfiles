return {
	"mfussenegger/nvim-dap",
	cmd = "DapToggleBreakpoint",
	keys = { "<leader>ic", "<leader>ib", "<leader>iB", "<leader>iO>" },
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",

		"mfussenegger/nvim-dap-python",
		"leoluz/nvim-dap-go",
		"mxsdev/nvim-dap-vscode-js",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			automatic_setup = true,
			ensure_installed = {
				"delve",
				"debugpy",
			},
		})

		vim.keymap.set("n", "<leader>ic", dap.continue, { desc = "Debug: Start/Continue" })
		vim.keymap.set("n", "<leader>ii", dap.step_into, { desc = "Debug: Step Into" })
		vim.keymap.set("n", "<leader>io", dap.step_over, { desc = "Debug: Step Over" })
		vim.keymap.set("n", "<leader>iu", dap.step_out, { desc = "Debug: Step Out" })
		vim.keymap.set("n", "<leader>it", dap.terminate, { desc = "Debug:Terminate" })
		vim.keymap.set("n", "<leader>iC", dap.run_to_cursor, { desc = "Debug:Run to Cursor" })
		vim.keymap.set("n", "<leader>ib", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>il", dap.list_breakpoints, { desc = "Debug: List Breakpoints" })
		vim.keymap.set("n", "<leader>iR", dap.clear_breakpoints, { desc = "Debug: Remove All Breakpoints" })
		vim.keymap.set("n", "<leader>iB", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Debug: Set Breakpoint" })

		dapui.setup({
			icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
			controls = {
				icons = {
					pause = "⏸",
					play = "▶",
					step_into = "⏎",
					step_over = "⏭",
					step_out = "⏮",
					step_back = "b",
					run_last = "▶▶",
					terminate = "⏹",
					disconnect = "⏏",
				},
			},
		})

		vim.keymap.set("n", "<leader>iO", function()
			local widgets = require("dap.ui.widgets")
			local sidebar = widgets.sidebar(widgets.scopes)
			sidebar.open()
		end, { desc = "Open DAP sidebar" })
		vim.keymap.set("n", "<leader>iL", dapui.toggle, { desc = "Debug: See last session result." })

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close

		require("dap-go").setup()

		vim.keymap.set("n", "<leader>ipm", require("dap-python").test_method, { desc = "Debug (python): test method" })
		vim.keymap.set("n", "<leader>ipc", require("dap-python").test_class, { desc = "Debug (python): test class" })
		vim.keymap.set(
			"n",
			"<leader>ips",
			require("dap-python").debug_selection,
			{ desc = "Debug (python): debug selection" }
		)
		require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

		require("dap-vscode-js").setup({
			-- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
			debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
			-- debugger_cmd = { "extension" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
			adapters = {
				"chrome",
				"pwa-node",
				"pwa-chrome",
				"pwa-msedge",
				"node-terminal",
				"pwa-extensionHost",
				"node",
				"chrome",
			}, -- which adapters to register in nvim-dap
			-- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
			-- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
			-- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
		})
		local js_based_languages = { "typescript", "javascript", "typescriptreact" }

		for _, language in ipairs(js_based_languages) do
			require("dap").configurations[language] = {
				{
					{
						type = "pwa-node",
						request = "launch",
						name = "Debug Jest Tests",
						-- trace = true, -- include debugger info
						runtimeExecutable = "node",
						runtimeArgs = {
							"./node_modules/jest/bin/jest.js",
							"--runInBand",
						},
						rootPath = "${workspaceFolder}",
						cwd = "${workspaceFolder}",
						console = "integratedTerminal",
						internalConsoleOptions = "neverOpen",
					},
				},
				{
					type = "pwa-chrome",
					request = "launch",
					name = 'Start Chrome with "localhost"',
					url = "http://localhost:3000",
					webRoot = "${workspaceFolder}",
					userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
				},
			}
		end
	end,
}
