local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Save/restore folds automatically
local foldGrp = augroup("Folding", { clear = true })
autocmd({ "BufWinLeave", "BufLeave", "BufWritePost", "BufHidden", "QuitPre" }, {
	pattern = "?*",
	command = "silent! mkview",
	group = foldGrp,
})
autocmd("BufWinEnter", {
	pattern = "?*",
	command = "silent! loadview",
	group = foldGrp,
})
autocmd("BufRead", {
	pattern = "?*",
	command = "normal zR",
	group = foldGrp,
})

-- Highlight text on yank
local yankGroup = augroup("HighlightYank", { clear = true })
autocmd("TextYankPost", {
	group = yankGroup,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 40 })
	end,
})

-- Remove trailing whitespaces on write
local cleanupGroup = augroup("Cleanup", { clear = true })
autocmd("BufWritePre", {
	group = cleanupGroup,
	pattern = "*",
	command = "%s/\\s\\+$//e",
})

local numbertoggleGroup = augroup("numbertoggle", { clear = true })
autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
	group = numbertoggleGroup,
	pattern = "*",
	callback = function()
		if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
			vim.opt.relativenumber = true
		end
	end,
})
autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
	group = numbertoggleGroup,
	pattern = "*",
	callback = function()
		if vim.o.nu then
			vim.opt.relativenumber = false
			vim.cmd("redraw")
		end
	end,
})

local startupGroup = augroup("startup", { clear = true })
autocmd("VimEnter", { group = startupGroup, pattern = "*", command = "Ex" })

local colorGroup = augroup("colorscheme", { clear = true })
autocmd("BufWritePost", {
	group = colorGroup,
	pattern = "~/dotfiles/nvim-lazy/init.lua",
	callback = function()
		local active_color_scheme = require("core.colors").active
		require("core.colors")[active_color_scheme]()
	end,
})
