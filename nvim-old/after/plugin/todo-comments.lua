local set = vim.keymap.set

set({ "n", "v" }, "]t", function()
	require("todo-comments").jump_next()
end, { silent = true, noremap = true, desc = "Next todo comment" })
set({ "n", "v" }, "[t", function()
	require("todo-comments").jump_prev()
end, { silent = true, noremap = true, desc = "Previous todo comment" })
set({ "n", "v" }, "<leader>xt", "<cmd>TodoTrouble<cr>", { silent = true, noremap = true, desc = "Todo (Trouble)" })
set(
	{ "n", "v" },
	"<leader>xT",
	"<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",
	{ silent = true, noremap = true, desc = "Todo/Fix/Fixme (Trouble)" }
)
set({ "n", "v" }, "<leader>ft", "<cmd>TodoTelescope<cr>", { silent = true, noremap = true, desc = "Todo" })
