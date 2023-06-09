local opt = vim.opt
local api = vim.api

vim.g.mapleader = " "
vim.g.netrw_keepdir = 1

opt.number = true
opt.numberwidth = 5
opt.relativenumber = true

opt.background = "dark"

opt.backspace = "2"

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.autoindent = true
opt.smartindent = true

opt.wrap = true
opt.linebreak = true

opt.splitbelow = true
opt.splitright = true

opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim_undodir"

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

opt.colorcolumn = "80"

opt.foldmethod = "indent"
opt.foldlevel = 1
opt.foldenable = false -- open folds by default

-- save/restore folds automatically
-- https://vi.stackexchange.com/questions/13864/bufwinleave-mkview-with-unnamed-file-error-32
local foldGrp = api.nvim_create_augroup("Folding", { clear = true })
api.nvim_create_autocmd({ "BufWinLeave", "BufLeave", "BufWritePost", "BufHidden", "QuitPre" }, {
	pattern = "?* nested",
	command = "silent! mkview",
	group = foldGrp,
})
api.nvim_create_autocmd("BufWinEnter", {
	pattern = "?*",
	command = "silent! loadview",
	group = foldGrp,
})
api.nvim_create_autocmd("BufRead", {
	pattern = "?*",
	command = "normal zR",
	group = foldGrp,
})
