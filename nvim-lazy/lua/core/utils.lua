local M = {}

local default_map_opts = { silent = true, noremap = true }
M.load_mappings = function(section)
	local function set_section_mappings(section_mappings)
		for mode, mode_mappings in pairs(section_mappings) do
			for keymap, map_info in pairs(mode_mappings) do
				local opts = map_info.opts or default_map_opts
				opts.desc = map_info[2]
				vim.keymap.set(mode, keymap, map_info[1], opts)
			end
		end
	end

	local m = require("core.mappings")
	local mappings = m[section] or m.general

	set_section_mappings(mappings)
end

M.set_colorscheme = function(colorscheme)
	colorscheme = colorscheme or "gruvbox"
	vim.cmd.colorscheme(colorscheme)

	-- TODO: test without
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	-- disable typescript interface semantic highlighting
	-- clash between treesitter and lsp semantic highlighting
	-- treats the whole interface declaration as interface keyword
	-- and has the whole line in red
	vim.api.nvim_set_hl(0, "@lsp.type.interface.typescript", {})
end

return M
