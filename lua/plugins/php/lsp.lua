return {
  {
    "neovim/nvim-lspconfig",
    opts = {
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
