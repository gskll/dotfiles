M = {}

-- this should be changed through the command line to keep tmux/alacritty in sync
-- see zsh function `switch_color_scheme`
M.active = "tokyonight"

function M.gruvbox()
	print("Setting colorscheme to gruvbox", "Normal")
	vim.cmd.colorscheme("gruvbox")
	vim.opt.background = "dark"

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
