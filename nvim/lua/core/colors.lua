M = {}

-- this should be changed through the command line to keep tmux/alacritty in sync
-- see zsh function `switch_color_scheme`
M.active = "gruvbox"

function M.gruvbox()
	vim.opt.background = "dark"
	vim.cmd.colorscheme("gruvbox-material")

	-- disable typescript interface semantic highlighting
	-- clash between treesitter and lsp semantic highlighting
	-- treats the whole interface declaration as interface keyword
	-- and has the whole line in red
	vim.api.nvim_set_hl(0, "@lsp.type.interface.typescript", {})
end

function M.tokyonight()
	vim.cmd.colorscheme("tokyonight")
	vim.opt.background = "dark"
end

function M.tokyolight()
	vim.cmd.colorscheme("tokyonight")
	vim.opt.background = "light"
end

function M.kanagawa()
	vim.cmd.colorscheme("kanagawa")
	vim.opt.background = "dark"
end

return M
