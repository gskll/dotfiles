return {
	{ "tpope/vim-sleuth", event = "VeryLazy" },
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		priority = 1000,
		keys = { { "-", "<cmd>Oil<cr>", desc = "Oil: open parent dir" } },
		opts = {
			default_file_explorer = true,
			delete_to_trash = true,
			keymaps = {
				["<C-p>"] = false,
				["<C-l>"] = false,
				["<C-h>"] = false,
				["gx"] = false,
				["<C-f>"] = "actions.preview",
				["<C-r>"] = "actions.refresh",
				["<C-\\>"] = "actions.select_vsplit",
				["<C-->"] = "actions.select_split",
			},
			view_options = {
				show_hidden = true,
			},
		},
		config = true,
	},

	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		version = false,
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				enabled = vim.fn.executable("make") == 1,
				config = function()
					require("telescope").load_extension("fzf")
				end,
			},
		},
		opts = function()
			local actions = require("telescope.actions")
			local open_with_trouble = function(...)
				return require("trouble.providers.telescope").open_with_trouble(...)
			end
			return {
				defaults = {
					path_display = { truncate = 3 },
					mappings = {
						i = {
							["<C-u>"] = false,
						},
					},
				},
				mappings = {
					n = {
						["<c-t>"] = open_with_trouble,
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
			}
		end,
		keys = {
			-- files
			{ "<leader><leader>", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
			{ "<leader>f.", "<cmd>Telescope oldfiles<cr>", desc = "Old files" },
			{ "g/", "<cmd>Telescope find_files<cr>", desc = "Find files" },
			{ "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find files with hidden" },
			{ "<c-p>", "<cmd>Telescope git_files<cr>", desc = "Git files" },

			-- misc
			{ "<leader>fr", "<cmd>Telescope resume<cr>", desc = "Search resume" },

			-- git
			{ "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Telescope git_commits" } },
			{ "<leader>gfc", "<cmd>Telescope git_bcommits<cr>", { desc = "Telescope file commits" } },
			{ "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Telescope git_branches" } },
			{ "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Telescope git_status" } },
			{ "<leader>gS", "<cmd>Telescope git_stash<cr>", { desc = "Telescope git_stash" } },

			-- search
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Telescope live_grep" } },
			{
				"<leader>fG",
				"<cmd>Telescope grep_string<cr>",
				{ desc = "Telescope grep string under cursor or selection" },
			},
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Telescope help tags" },
			{ "<leader>fR", "<cmd>Telescope registers<cr>", desc = "Registers" },
			{ "<leader>fc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
			{ "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
			{ "<leader>fD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
			{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
			{ "<leader>fM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
			{ "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
		},
	},

	{
		"echasnovski/mini.bufremove",
		keys = {
			{
				"<leader>bd",
				function()
					local bd = require("mini.bufremove").delete
					if vim.bo.modified then
						local choice =
							vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
						if choice == 1 then -- Yes
							vim.cmd.write()
							bd(0)
						elseif choice == 2 then -- No
							bd(0, true)
						end
					else
						bd(0)
					end
				end,
				desc = "Delete Buffer",
			},
			{
				"<leader>bD",
				function()
					require("mini.bufremove").delete(0, true)
				end,
				desc = "Delete Buffer (Force)",
			},
		},
	},

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = { "TroubleToggle", "Trouble" },
		opts = { use_diagnostic_signs = true },
		keys = {
			{ "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
			{ "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
			{ "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
			{ "<leader>xc", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
			{
				"[q",
				function()
					if require("trouble").is_open() then
						require("trouble").previous({ skip_groups = true, jump = true })
					else
						vim.cmd.cprev()
					end
				end,
				desc = "Previous trouble/quickfix item",
			},
			{
				"]q",
				function()
					if require("trouble").is_open() then
						require("trouble").next({ skip_groups = true, jump = true })
					else
						vim.cmd.cnext()
					end
				end,
				desc = "Next trouble/quickfix item",
			},
		},
	},

	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		config = true,
		keys = {
			{
				"]t",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "Next todo comment",
			},
			{
				"[t",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "Previous todo comment",
			},
			{ "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
			{ "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
			{ "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Todo" },
			{ "<leader>fT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
		},
	},

	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		keys = { { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle undo tree" } },
	},

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
        -- stylua: ignore
		keys = {
			{ "<leader>a", function() require("harpoon"):list():add() end, "Append to harpoon list" },
			{ "<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, "Toggle harpoon popup" },
			{ "<leader>1", function() require("harpoon"):list():select(1) end, "Select harpoon list item 1" },
			{ "<leader>2", function() require("harpoon"):list():select(2) end, "Select harpoon list item 2" },
			{ "<leader>3", function() require("harpoon"):list():select(3) end, "Select harpoon list item 3" },
			{ "<leader>4", function() require("harpoon"):list():select(4) end, "Select harpoon list item 4" },
			{ "<leader>5", function() require("harpoon"):list():select(5) end, "Select harpoon list item 5" },
			{ "[h", function() require("harpoon"):list():prev() end, "Previous harpoon list buffer" },
			{ "]h", function() require("harpoon"):list():next() end, "Next harpoon list buffer" },
		},
		opts = {},
	},

	{
		"eandrju/cellular-automaton.nvim",
		cmd = "CellularAutomaton",
		keys = { "<leader>fml" },
		config = function()
			vim.api.nvim_set_keymap("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<cr>", { noremap = true })
		end,
	},
}
