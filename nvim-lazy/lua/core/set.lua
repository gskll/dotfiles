local g = vim.g
local opt = vim.opt

g.mapleader = " "
g.netrw_keepdir = 1

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

opt.swapfile = true
opt.updatetime = 250
opt.backup = false
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim_undodir"
opt.timeoutlen = 300

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

-- opt.colorcolumn = "80"
-- opt.cursorline = true

opt.foldmethod = "indent"
opt.foldlevel = 1
opt.foldenable = false -- open folds by default

opt.inccommand = "split"
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }