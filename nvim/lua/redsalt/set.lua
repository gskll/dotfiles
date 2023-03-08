local opt = vim.opt

vim.g.mapleader = " "

opt.number = true
opt.numberwidth = 5
opt.relativenumber = true

opt.background = "dark"

opt.backspace = "2"

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

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

