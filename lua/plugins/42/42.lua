return {
	{
		"hardyrafael17/norminette42.nvim",
		lazy = true,
		ft = {'c', 'h'},
		opts = {
			runOnSave = true,
			maxErrorsToShow = 5,
			active = true,
		},
	},
	{
		"pbondoer/vim-42header",
		ft = {'c', 'h'},
		keys = {
			{
				"<leader>^",
				"<cmd>Stdheader<cr>",
				desc = "Adds 42 Header",
			},
		},
	},
}
