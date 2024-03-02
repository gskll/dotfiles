local M = {}

M.general = {
	plugin = false,
	n = {
		["E"] = { "$", "Jump to line end" },
		["B"] = { "^", "Jump to line start" },
		["zz"] = { vim.cmd.update, "Update buffer", opts = { noremap = true } },

		["zx"] = { ":noa w<CR>", "Update buffer no autocmd", opts = { noremap = true } },

		["J"] = { "mzJ`z", "Append next line keeping same cursor position" },

		["j"] = { "v:count==0 ? 'gjzz' : 'jzz'", "Down", opts = { expr = true, silent = true, nnoremap = true } },
		["k"] = { "v:count==0 ? 'gkzz' : 'kzz'", "Up", opts = { expr = true, silent = true, nnoremap = true } },
		["<C-d>"] = { "<C-d>zz", "Keep cursor centred on screen down", opts = { nnoremap = true } },
		["<C-u>"] = { "<C-u>zz", "Keep cursor centred on screen up", opts = { nnoremap = true } },

		["n"] = { "nzzzv", "Keep cursor centred on next match", opts = { nnoremap = true } },
		["N"] = { "Nzzzv", "Keep cursor centred on prev match", opts = { nnoremap = true } },
		["<leader>/"] = { ":noh<CR>", "Clear search highlighting" },

		["<leader>y"] = { '"+y', "Yank to system clipboard" },
		["<leader>yy"] = { '"+yy', "Yank line to system clipboard" },
		["<leader>Y"] = { ":%y+<CR>", "Yank buffer to system clipboard" },
		["<leader>p"] = { '"+p', "Put after cursor from system clipboard" },
		["<leader>P"] = { '"+P', "Put before cursor from system clipbaord" },

		["<leader>d"] = { '"_d', "Delete to void register", opts = { nnoremap = true } },
		["x"] = { '"_x', "Delete single char to void register", opts = { nnoremap = true } },

		["<C-h>"] = { "<C-w><C-h>", "Move to window left of cursor" },
		["<C-j>"] = { "<C-w><C-j>", "Move to window down of cursor" },
		["<C-k>"] = { "<C-w><C-k>", "Move to window up of cursor" },
		["<C-l>"] = { "<C-w><C-l>", "Move to window right of cursor" },
		["<leader>sv"] = { "<C-w>v", "Split window vertically" },
		["<leader>sh"] = { "<C-w>s", "Split window horizontally" },
		["<leader>se"] = { "<C-w>=", "Size splits equally" },
		["<leader>sx"] = { vim.cmd.close, "Close current split" },
		["<C-]>"] = { "<C-^>", "Switch alternate files", opts = { nnoremap = true } },

		["<C-Up>"] = { ":resize +2<cr>", "Increase window height" },
		["<C-Down>"] = { ":resize -2<cr>", "Decrease window height" },
		["<C-Right>"] = { ":vertical resize +2<cr>", "Increase window width" },
		["<C-Left>"] = { ":vertical resize -2<cr>", "Decrease window width" },

		["<leader>to"] = { vim.cmd.tabnew, "Open new tab" },
		["<leader>tx"] = { vim.cmd.tabclose, "Close current tab" },
		["<leader>tn"] = { vim.cmd.tabn, "Go to next tab" },
		["<leader>tp"] = { vim.cmd.tabp, "Got to previous tab" },

		["<leader><leader>"] = { vim.cmd.source, "Source current file" },
		["Q"] = { "<nop>", "Disable uppercase Q" },

		["<leader>s"] = { ":%s/<<C-r><C-w>>/<C-r><C-w>/gI<Left><Left><Left>", "Replace word under cursor" },

		["<leader>co"] = { vim.cmd.copen, "Open quickfix list" },
		["<leader>cc"] = { vim.cmd.cclose, "Close quickfix list" },
		-- quickfix navigation set in trouble config

		["<leader>lo"] = { ":lopen<CR>", "Location list open" },
		["<leader>lc"] = { vim.cmd.lclose, "Location list close" },
		["<leader>lj"] = { ":lnext<CR>zz", "Location list next item", opts = { nnoremap = true } },
		["<leader>lk"] = { ":lprev<CR>zz", "Location list prev item", opts = { nnoremap = true } },
	},
	i = {
		["jk"] = { "<Esc>", "Escape insert mode" },
		["<C-W>"] = { "<Esc>:update<CR>", "Update buffer" },
	},
	v = {
		["E"] = { "$", "Jump to line end" },
		["B"] = { "^", "Jump to line start" },
		["J"] = { ":m '>+1<CR>gv=gv", "Move line selection down" },
		["K"] = { ":m '<-2<CR>gv=gv", "Move line selection up" },

		["<leader>y"] = { '"+y', "Yank to system clipboard" },
		["<leader>p"] = { '"_dP', "Replace selection with register without overwriting register" },

		["<leader>d"] = { '"_d', "Delete to void register", opts = { nnoremap = true } },
		["x"] = { '"_x', "Delete single char to void register", opts = { nnoremap = true } },
	},
	t = {
		["<C-\\><C-\\>"] = { "<C-\\><C-N>", "Exit term mode" },
	},
}

M.maximiser = {
	plugin = true,
	n = {
		["<leader>sm"] = { ":MaximiserToggle<CR>", "Toggle split window maximisation" },
	},
}

M.cellular_automaton = {
	plugin = true,
	n = {
		["<leader>fml"] = { ":CellularAutomaton make_it_rain<CR>", "fml" },
	},
}

return M
