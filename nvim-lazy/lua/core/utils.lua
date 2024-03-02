local M = {}

M.load_mappings = function()
	local function set_section_mappings(section_mappings)
		if section_mappings.plugin then
			return
		end
		section_mappings.plugin = nil

		for mode, mappings in pairs(section_mappings) do
			for keymap, map_info in pairs(mappings) do
				local opts = map_info.opts or {}
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
