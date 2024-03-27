require("core")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
local lazy_config = require("core.lazy_config")
require("lazy").setup("plugins", lazy_config)

local active_color_scheme = require("core.colors").active
require("core.colors")[active_color_scheme]()

vim.cmd("Copilot disable")
