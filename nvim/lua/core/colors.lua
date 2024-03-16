M = {}

-- this should be changed through the command line to keep tmux/alacritty in sync
-- see zsh function `switch_color_scheme`
M.active = "tokyonight"

function M.gruvbox()
	vim.cmd.colorscheme("gruvbox")

	-- disable typescript interface semantic highlighting
	-- clash between treesitter and lsp semantic highlighting
	-- treats the whole interface declaration as interface keyword
	-- and has the whole line in red
	vim.api.nvim_set_hl(0, "@lsp.type.interface.typescript", {})
end

function M.tokyonight()
	vim.cmd.colorscheme("tokyonight")
end

function M.kanagawa()
	vim.cmd.colorscheme("kanagawa")
end

return M
