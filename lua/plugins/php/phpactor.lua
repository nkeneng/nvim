return {
	{
		"gbprod/phpactor.nvim",
		ft = 'php',
		build = function()
			require("phpactor.handler.update")()
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"neovim/nvim-lspconfig"
		},
		config = function()
			vim.keymap.set('n', '<Leader>pA', ':PhpActor<CR>')
		end,
	},
	{
		"phpactor/phpactor",
		lazy = false,
		ft = 'php',
		run = 'composer install --no-dev --optimize-autoloader',
		config = function()
			vim.keymap.set('n', '<Leader>pm', ':PhpactorContextMenu<CR>')
			vim.keymap.set('n', '<Leader>pn', ':PhpactorClassNew<CR>')
			vim.keymap.set('n', '<Leader>gd', ':PhpactorGotoDefinition<CR>')
			vim.keymap.set('n', '<Leader>em', ':PhpactorExtractMethod<CR>')
		end,
	}
}
