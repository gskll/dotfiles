local keymap = vim.keymap

keymap.set("i", "jk", "<Esc>", { desc = "Escape insert mode" })
keymap.set("n", "E", "$", { desc = "Remap line end" })
keymap.set("n", "B", "^", { desc = "Remap line start" })

-- file saving
keymap.set("n", "zz", vim.cmd.update, { desc = "Update from NORMAL" })
keymap.set("i", "<C-W>", "<Esc>:update<CR>", { desc = "Update from INSERT" })

-- move lines
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line selection down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line selection up" })
keymap.set("n", "J", "mzJ`z", { desc = "Append next line keeping same cursor position" })

-- move screen
keymap.set("n", "j", "jzz", { desc = "Keep cursor centred on line down" })
keymap.set("n", "k", "kzz", { desc = "Keep cursor centred on line up" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Keep cursor centred on screen down" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Keep cursor centred on screen up" })

-- file search
keymap.set("n", "n", "nzzzv", { desc = "Keep cursor centred on next search match" })
keymap.set("n", "N", "Nzzzv", { desc = "Keep cursor centred on prev search match" })
keymap.set("n", "<leader>/", ":noh<CR>", {desc = "Clear search highlighting"})

-- clipboard copy
keymap.set({ "n", "v" }, "<leader>y", "\"+y", { desc = "Yank to system clipboard" })
keymap.set("n", "<leader>yy", "\"+yy", { desc = "Yank line to system clipboard" })
keymap.set("n", "<leader>Y", ":%y+<CR>", { desc = "Yank line to system clipboard" })

-- clipboard paste
keymap.set("n", "<leader>p", "\"+p", { desc = "Put/paste after cursor from system clipboard" })
keymap.set("n", "<leader>P", "\"+P", { desc = "Put/paste before cursor from system clipboard" })
keymap.set("v", "<leader>p", "\"_dP", { desc = "Replace selection with register without overwriting register" })

-- text deletion
keymap.set({ "n", "v" }, "<leader>d", "\"_d", { desc = "Delete to void register" })
keymap.set({ "n", "v" }, "x", "\"_x", { desc = "Delete single char to void register" })

-- window management
keymap.set("n", "<C-h>", "<C-w><C-h>", {desc = "Move to cursor left a window"})
keymap.set("n", "<C-j>", "<C-w><C-j>", {desc = "Move to cursor down a window"})
keymap.set("n", "<C-k>", "<C-w><C-k>", {desc = "Move to up a window"})
keymap.set("n", "<C-l>", "<C-w><C-l>", {desc = "Move to right a window"})
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split windows equal width & height" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close current split window" })
keymap.set("n", "<tab>", "<C-w><C-w>", { desc = "Go to next split window" })
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", {desc = "Toggle split window maximization"})

-- tab management
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Go to previous tab" })

keymap.set("n", "<leader><leader>", vim.cmd.source, { desc = "Source current file" })
keymap.set("n", "Q", "<nop>", { desc = "Disable uppercase Q" })
keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, {desc = "Format file"})

-- Misc
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = "Replace current word global"})
keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>", {desc = "fml"})

keymap.set("n", "<leader>vpp", "<cmd>e ~/dotfiles/nvim/lua/redsalt/packer.lua<CR>");

keymap.set("n", "<leader>co", "<cmd>copen<CR>", {desc = "Quickfix list open"})
keymap.set("n", "<leader>ck", "<cmd>cnext<CR>zz", {desc = "Quickfix list next item"})
keymap.set("n", "<leader>cj", "<cmd>cprev<CR>zz", {desc = "Quickfix list prev item"})
keymap.set("n", "<leader>lo", "<cmd>lopen<CR>", {desc = "Location list open"})
keymap.set("n", "<leader>lk", "<cmd>lnext<CR>zz", {desc = "Location list next item"})
keymap.set("n", "<leader>lj", "<cmd>lprev<CR>zz", {desc = "Location list prev item"})
