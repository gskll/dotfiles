local keymap = vim.keymap

keymap.set("n", "<leader>G", ":vertical Git<CR>")
keymap.set("n", "<leader>Gc", ":Git commit -m \"")
keymap.set("n", "<leader>Gp", ":Git push -u origin HEAD<CR>")
keymap.set("n", "<leader>GS", ":Git stash push -m \"")

