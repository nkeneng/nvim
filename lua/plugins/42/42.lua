return {
  {
    "hardyrafael17/norminette42.nvim",
    lazy = true,
    ft = { "c", "h" },
    opts = {
      runOnSave = true,
      maxErrorsToShow = 5,
    },
  },
  {
    "pbondoer/vim-42header",
    ft = { "c", "h" },
    keys = {
      {
        "<leader>^",
        "<cmd>Stdheader<cr>",
        desc = "Adds 42 Header",
      },
    },
  },
  {
    "cacharle/c_formatter_42.vim",
    ft = { "c", "h" },
    keys = {
      {
        "<leader>cg",
        "<cmd>CFormatter42<cr>",
        desc = "Format 42 file",
      },
    },
  },
}
