local set = vim.keymap.set
set(
	{ "n", "v" },
	"<leader>xx",
	"<cmd>TroubleToggle document_diagnostics<cr>",
	{ silent = true, noremap = true, desc = "Document Diagnostics (Trouble)" }
)
set(
	{ "n", "v" },
	"<leader>xX",
	"<cmd>TroubleToggle workspace_diagnostics<cr>",
	{ silent = true, noremap = true, desc = "Workspace Diagnostics (Trouble)" }
)
set(
	{ "n", "v" },
	"<leader>xQ",
	"<cmd>TroubleToggle loclist<cr>",
	{ silent = true, noremap = true, desc = "Location List (Trouble)" }
)
set(
	{ "n", "v" },
	"<leader>xL",
	"<cmd>TroubleToggle quickfix<cr>",
	{ silent = true, noremap = true, desc = "Quickfix List (Trouble)" }
)

set({ "n", "v" }, "]q", function()
	if require("trouble").is_open() then
		require("trouble").previous({ skip_groups = true, jump = true })
	else
		vim.cmd.cprev()
	end
end, { silent = true, noremap = true, desc = "Previous trouble/quickfix item" })
set({ "n", "v" }, "[q", function()
	if require("trouble").is_open() then
		require("trouble").next({ skip_groups = true, jump = true })
	else
		vim.cmd.cnext()
	end
end, { silent = true, noremap = true, desc = "Next trouble/quickfix item" })
