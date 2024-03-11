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

	local mappings = require("core.mappings")
	for _, mapping in pairs(mappings) do
		set_section_mappings(mapping)
	end
end

return M
