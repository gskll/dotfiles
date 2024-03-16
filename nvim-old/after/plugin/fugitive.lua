local keymap = vim.keymap

keymap.set("n", "<leader>G", ":Git<CR>")
keymap.set("n", "<leader>Gc", ':Git commit --no-verify -m "')
keymap.set("n", "<leader>Gp", ":Git push -u origin HEAD<CR>")
keymap.set("n", "<leader>GS", ':Git stash push -m "')

keymap.set("n", "<leader>gd", ":Gvdiffsplit!<CR>", { noremap = true })
keymap.set("n", "<leader>gh", ":diffget //2<CR>", { noremap = true })
keymap.set("n", "<leader>gl", ":diffget //3<CR>", { noremap = true })

local function showFugitiveGit()
	if vim.fn.FugitiveHead() ~= "" then
		vim.cmd([[
    Git
    " wincmd H  " Open Git window in vertical split
    " setlocal winfixwidth
    " vertical resize 31
    " setlocal winfixwidth
    setlocal nonumber
    setlocal norelativenumber
    ]])
	end
end
local function toggleFugitiveGit()
	if vim.fn.buflisted(vim.fn.bufname("fugitive:///*/.git//$")) ~= 0 then
		vim.cmd([[ execute ":bdelete" bufname('fugitive:///*/.git//$') ]])
	else
		showFugitiveGit()
	end
end
vim.keymap.set("n", "<leader>G", toggleFugitiveGit, { desc = "Toggle Fugitive Git", silent = true, noremap = true })
