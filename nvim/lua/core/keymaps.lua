local map = vim.keymap.set

map("i", "jk", "<Esc>", { desc = "Escape insert mode" })
map({ "n", "v" }, "E", "$", { desc = "Remap line end" })
map({ "n", "v" }, "B", "^", { desc = "Remap line start" })

-- file saving
map("n", "zz", vim.cmd.update, { desc = "Update from NORMAL", noremap = true })
map("n", "zx", ":noa w<CR>", { desc = "Update from NORMAL no autocmd", noremap = true })
map("i", "<C-W>", "<Esc>:update<CR>", { desc = "Update from INSERT" })

-- move lines
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line selection up" })
map("n", "J", "mzJ`z", { desc = "Append next line keeping same cursor position" })

-- move screen
map("n", "j", "v:count == 0 ? 'gjzz' : 'jzz'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gkzz' : 'kzz'", { expr = true, silent = true })
map("n", "<C-d>", "<C-d>zz", { desc = "Keep cursor centred on screen down", noremap = true })
map("n", "<C-u>", "<C-u>zz", { desc = "Keep cursor centred on screen up", noremap = true })

-- file search
map("n", "n", "nzzzv", { desc = "Keep cursor centred on next search match", noremap = true })
map("n", "N", "Nzzzv", { desc = "Keep cursor centred on prev search match", noremap = true })
map("n", "<leader>/", ":noh<CR>", { desc = "Clear search highlighting" })

-- clipboard copy
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("n", "<leader>yy", '"+yy', { desc = "Yank line to system clipboard" })
map("n", "<leader>Y", ":%y+<CR>", { desc = "Yank buffer to system clipboard" })

-- clipboard paste
map("n", "<leader>p", '"+p', { desc = "Put/paste after cursor from system clipboard" })
map("n", "<leader>P", '"+P', { desc = "Put/paste before cursor from system clipboard" })
map("v", "<leader>p", '"_dP', { desc = "Replace selection with register without overwriting register" })

-- text deletion
map({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete to void register", noremap = true })
map({ "n", "v" }, "x", '"_x', { desc = "Delete single char to void register" })

-- window management
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move to cursor left a window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move to cursor down a window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move to up a window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move to right a window" })
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make split windows equal width & height" })
map("n", "<leader>sx", vim.cmd.close, { desc = "Close current split window" })
map("t", "<C-\\><C-\\>", "<C-\\><C-N>", { desc = "Exit term mode" })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- tab management
map("n", "<leader>to", vim.cmd.tabnew, { desc = "Open new tab" })
map("n", "<leader>tx", vim.cmd.tabclose, { desc = "Close current tab" })
map("n", "<leader>tn", vim.cmd.tabn, { desc = "Go to next tab" })
map("n", "<leader>tp", vim.cmd.tabp, { desc = "Go to previous tab" })

map("n", "Q", "<nop>", { desc = "Disable uppercase Q" })

-- buffers
map("n", "<C-]>", "<C-^>", { desc = "Switch to alternate file", noremap = true })

-- Misc
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace current word global" })

-- quickfix
-- ]q/[q to navigate quickfix - set in trouble.lua
map("n", "<leader>co", vim.cmd.copen, { desc = "Quickfix list open" })
map("n", "<leader>cc", vim.cmd.cclose, { desc = "Quickfix list close" })

-- loclist
map("n", "<leader>lo", ":lopen<CR>", { desc = "Location list open" })
map("n", "<leader>lc", vim.cmd.lclose, { desc = "Location list close" })
map("n", "<leader>lj", ":lnext<CR>zz", { desc = "Location list next item", noremap = true })
map("n", "<leader>lk", ":lprev<CR>zz", { desc = "Location list prev item", noremap = true })

-- diagnostics
map("n", "[d", function()
	vim.diagnostic.goto_prev({ float = false })
end, { desc = "Go to previous diagnostic message" })
map("n", "]d", function()
	vim.diagnostic.goto_next({ float = false })
end, { desc = "Go to next diagnostic message" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic float" })
