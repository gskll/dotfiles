local dap = require("dap")
local dapgo = require("dap-go")
local set = vim.keymap.set

set("n", "<leader>bb", dap.toggle_breakpoint, { desc = "Toggle DAP breakpoint", noremap = true })
set("n", "<leader>bc", dap.continue, { desc = "Continue DAP", noremap = true })
set("n", "<leader>bo", dap.step_over, { desc = "Step over DAP", noremap = true })
set("n", "<leader>bi", dap.step_into, { desc = "Step into DAP", noremap = true })
set("n", "<leader>bs", function()
	local widgets = require("dap.ui.widgets")
	local sidebar = widgets.sidebar(widgets.scopes)
	sidebar.open()
end, { desc = "Open DAP sidebar", noremap = true })

-- go specific
set("n", "<leader>bt", dapgo.debug_test, { desc = "Debug nearest go test", noremap = true })
set("n", "<leader>bl", dapgo.debug_last_test, { desc = "Debug last go test", noremap = true })

dapgo.setup()

require("mason-nvim-dap").setup({
	ensure_installed = {
		"delve",
	},
})
