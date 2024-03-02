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
