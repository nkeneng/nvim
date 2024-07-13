local ts_select_dir_for_grep_global = function(prompt_bufnr)
	local telescope = require("telescope")
	local action_state = require("telescope.actions.state")
	local fb = telescope.extensions.file_browser
	local find_files = require('telescope.builtin').find_files

	fb.file_browser({
		-- files = false,
		attach_mappings = function(prompt_bufnr)
			require("telescope.actions").select_default:replace(function()
				local entry_path = action_state.get_selected_entry().Path
				local dir = entry_path:is_dir() and entry_path or entry_path:parent()
				local absolute = dir:absolute()
				vim.cmd('lcd ' .. absolute)
				vim.notify("Absolute: " .. tostring(absolute), vim.log.levels.INFO)

				find_files({
					cwd = absolute
				})
			end)

			return true
		end,
	})
end

return {
	{
		"telescope.nvim",
		opts = {
			defaults = {
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				winblend = 0,
			},
		},
		dependencies = {
			-- {
			-- 	"nvim-telescope/telescope-fzf-native.nvim",
			-- 	build = "make",
			-- 	config = function()
			-- 		require("telescope").load_extension("fzf")
			-- 	end,
			-- },
			{
				"nvim-telescope/telescope-file-browser.nvim",
				-- dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
				config = function()
					vim.keymap.set("n", "<leader>fn", ":Telescope file_browser<CR>")
					local telescope = require("telescope")
					telescope.setup {
						extensions = {
							file_browser = {
								-- path = vim.fn.getcwd(),
								-- cwd_to_path = true,
								theme = "ivy",
								-- disables netrw and use telescope-file-browser in its place
								hijack_netrw = true,
							},
						},
					}
					require("telescope").load_extension "file_browser"
				end,
			},
			{
				"nvim-telescope/telescope-live-grep-args.nvim",
				version = "^1.0.0",
				config = function()
					local telescope = require("telescope")
					local lga_actions = require("telescope-live-grep-args.actions")
					local action_state = require("telescope.actions.state")
					local fb = telescope.extensions.file_browser
					local live_grep = telescope.extensions.live_grep_args.live_grep_args

					local ts_select_dir_for_grep = function(prompt_bufnr)
						fb.file_browser({
							-- files = false,
							attach_mappings = function(prompt_bufnr)
								require("telescope.actions").select_default:replace(function()
									local entry_path = action_state.get_selected_entry().Path
									local dir = entry_path:is_dir() and entry_path or entry_path:parent()
									local absolute = dir:absolute()
									-- vim.fn.chdir(absolute)
									vim.cmd('cd ' .. absolute)
									-- vim.notify("Absolute: " .. tostring(absolute), vim.log.levels.INFO)

									live_grep({
										search_dirs = { absolute }
									})
								end)

								return true
							end,
						})
					end


					telescope.setup {
						extensions = {
							live_grep_args = {
								auto_quoting = true, -- enable/disable auto-quoting
								-- define mappings, e.g.
								mappings = { -- extend mappings
									i = {
										["<C-k>"] = lga_actions.quote_prompt(),
										["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
										["<C-f>"] = ts_select_dir_for_grep,
										["<C-l>"] = require("telescope.actions").to_fuzzy_refine,
										-- freeze the current list and start a fuzzy search in the frozen list
									},
									n = {
										["<C-f>"] = ts_select_dir_for_grep,
									},
								},
							}
						}
					}
					telescope.load_extension("live_grep_args")
				end,
			},
		},
		keys = {
			{
				"<leader>fp",
				function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
				desc = "Find Plugin File",
			},
			{
				"<leader><space>",
				ts_select_dir_for_grep_global
			},

		},
	},
}
