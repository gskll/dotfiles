local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local map = vim.keymap

require("telescope").setup({
	defaults = {
		path_display = { truncate = 3 },
		mappings = {
			i = {
				["<C-u>"] = false,
			},
		},
	},
	pickers = {
		buffers = {
			mappings = {
				i = {
					["<c-d>"] = actions.delete_buffer,
				},
				n = {
					["<c-d>"] = actions.delete_buffer,
				},
			},
		},
	},
})

-- files
map.set("n", "<leader>fo", builtin.oldfiles, { desc = "Telescope oldfiles" })
map.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find_files" })
map.set("n", "<C-p>", builtin.git_files, { desc = "Telescope git_files" })
map.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live_grep" })
map.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
map.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
map.set("n", "<leader>fd", builtin.diagnostics, { desc = "Telescope diagnostics" })
map.set("n", "<leader>fs", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Telescope grep_string" })

-- git
map.set("n", "<leader>gc", builtin.git_commits, { desc = "Telescope git_commits" })
map.set("n", "<leader>gfc", builtin.git_bcommits, { desc = "Telescope file commits" })
map.set("n", "<leader>gb", builtin.git_branches, { desc = "Telescope git_branches" })
map.set("n", "<leader>gs", builtin.git_status, { desc = "Telescope git_status" })
map.set("n", "<leader>gS", builtin.git_stash, { desc = "Telescope git_stash" })
