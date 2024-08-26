-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = { "*.c", "*.h" },
  callback = function()
    if not string.match(vim.fn.expand("%:t"), "_test.c$") and vim.fn.expand("%:t") ~= "main.c" then
      vim.cmd("NorminetteEnable")
    else
      vim.cmd("NorminetteDisable")
    end
  end,
})
