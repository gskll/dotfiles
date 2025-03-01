return {
	{
		"tpope/vim-fugitive",
		cmd = "Git",
		keys = {
			{ "<leader>gt", "<cmd>Git<cr>", "Open fugitive" },
			{ "<leader>Gc", ':Git commit --no-verify -m "', "Git quick commit" },
			{ "<leader>Gp", "<cmd>Git push -u origin HEAD<cr>", "Git push upstream" },
			{ "<leader>GS", ':Git stash push -m "', "Git stash push" },
			{ "<leader>Gb", "<cmd>Git blame<cr>", "Git blame fugitive" },
			{ "<leader>gd", "<cmd>Gvdiffsplit!<cr>", "Open diff view" },
			{ "<leader>gh", "<cmd>diffget //2<cr>", "Diff get left" },
			{ "<leader>gl", "<cmd>diffget //3<cr>", "Diff get right" },
		},
	},

	{
		"Almo7aya/openingh.nvim",
		cmd = { "OpenInGHRepo", "OpenInGHFile", "OpenInGHFileLines" },
		keys = {
			{ "<leader>GR", "<cmd>OpenInGHRepo<cr>", "Open repo in github" },
			{ "<leader>GF", "<cmd>OpenInGHFile<cr>", "Open file in github" },
			{ "<leader>GL", "<cmd>OpenInGHFileLines<cr>", "Open file lines in github" },
		},
	},

	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			attach_to_untracked = true,
			current_line_blame = false,
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc, opts)
					opts = opts or {}
					opts.buffer = bufnr
					opts.desc = desc
					vim.keymap.set(mode, l, r, opts)
				end

				map("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, "Next hunk", { expr = true })

				map("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, "Prev hunk", { expr = true })

				map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
				map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
				map("n", "<leader>hu", gs.undo_stage_hunk, "Undo Stage Hunk")
				map("n", "<leader>hS", gs.stage_buffer, "Stage Buffer")
				map("n", "<leader>hR", gs.reset_buffer, "Reset Buffer")
				map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")
				map("n", "<leader>hpi", gs.preview_hunk_inline, "Preview Hunk Inline")
				map("n", "<leader>tb", gs.toggle_current_line_blame, "Toggle current line blame")
				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end, "Blame Line")
				map("n", "<leader>hd", gs.diffthis, "Diff This")
				map("n", "<leader>hD", function()
					gs.diffthis("~")
				end, "Diff This ~")

				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
				map("n", "<leader>hq", gs.setqflist, "Send gitsigns hunks to quickfix")
			end,
		},
	},

	{
		"pwntester/octo.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		cmd = "Octo",
		keys = { { "<leader>O", ':Octo "', "Populate command line with Octo" } },
		config = true,
	},
}
