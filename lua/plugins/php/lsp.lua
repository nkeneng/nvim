return {
  {
    "neovim/nvim-lspconfig",
	-- config = function()
	-- local builtin = require('telescope.builtin')
	-- vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {})
	-- end,
    opts = {
      -- @type lspconfig.options
      servers = {
        intelephense = {
          filetypes = { "php", "twig" },
          settings = {
            intelephense = {
              filetypes = { "php", "twig" },
              files = {
                associations = { "*.php", "*.twig.php" }, -- Associating .twig.php files as well
                maxSize = 5000000,
              },
            },
          },
        },
      },
    },
  },
}
