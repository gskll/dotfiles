return {
	"mfussenegger/nvim-dap",
	cmd = "DapToggleBreakpoint",
	key = {
		{},
	},
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",

		"leoluz/nvim-dap-go",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			automatic_setup = true,
			ensure_installed = {
				"delve",
			},
		})

		-- "i" for "inspect"
		vim.keymap.set("n", "<leader>ic", dap.continue, { desc = "Debug: Start/Continue" })
		vim.keymap.set("n", "<leader>ii", dap.step_into, { desc = "Debug: Step Into" })
		vim.keymap.set("n", "<leader>io", dap.step_over, { desc = "Debug: Step Over" })
		vim.keymap.set("n", "<leader>iu", dap.step_out, { desc = "Debug: Step Out" })
		vim.keymap.set("n", "<leader>ib", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
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

		-- go specific
		vim.keymap.set(
			"n",
			"<leader>bt",
			require("dap-go").debug_test,
			{ desc = "Debug nearest go test", noremap = true }
		)
		vim.keymap.set(
			"n",
			"<leader>bl",
			require("dap-go").debug_last_test,
			{ desc = "Debug last go test", noremap = true }
		)
		require("dap-go").setup()
	end,
}