-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
	return
end

-- get lualine gruvbox theme
local lualine_gruvbox = require("lualine.themes.gruvbox")
local lualine_tokyonight = require("lualine.themes.tokyonight")

-- configure lualine with modified theme
lualine.setup({
	options = {
		theme = lualine_tokyonight,
	},
})
