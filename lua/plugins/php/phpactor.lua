return {
  {
    "gbprod/phpactor.nvim",
    ft = "php",
    build = function()
      require("phpactor.handler.update")()
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      install = {
        path = vim.fn.stdpath("data") .. "/lazy/phpactor",
        branch = "master",
        bin = vim.fn.stdpath("data") .. "/lazy/phpactor/bin/phpactor",
        php_bin = "php",
        composer_bin = "composer",
        git_bin = "git",
        check_on_startup = "none",
      },
      lspconfig = {
        enabled = true,
        options = {},
      },
    },
    keys = {
      {
        "<leader>pA",
		":PhpActor<CR>",
        desc = "PhpActor",
      },
    },
  },
  {
    "phpactor/phpactor",
    lazy = false,
    ft = "php",
    run = "composer install --no-dev --optimize-autoloader",
    config = function()
      vim.keymap.set("n", "<Leader>pm", ":PhpactorContextMenu<CR>")
      vim.keymap.set("n", "<Leader>pn", ":PhpactorClassNew<CR>")
      vim.keymap.set("n", "<Leader>gd", ":PhpactorGotoDefinition<CR>")
      vim.keymap.set("n", "<Leader>em", ":PhpactorExtractMethod<CR>")
    end,
  },
}
