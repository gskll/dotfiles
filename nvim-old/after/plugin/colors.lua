require("gruvbox").setup({
	disable_background = true,
})

function ColorMyPencils(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	-- disable typescript interface semantic highlighting
	-- clash between treesitter and lsp semantic highlighting
	-- treats the whole interface declaration as interface keyword
	-- and has the whole line in red
	vim.api.nvim_set_hl(0, "@lsp.type.interface.typescript", {})
end

ColorMyPencils()
