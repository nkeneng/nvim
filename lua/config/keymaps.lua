-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- In your init.lua (for Lua configuration)
--
-- vim.keymap.set("n", "<leader>ig", ":lua require('telescope').extensions.live_grep_args.live_grep_args({ search_dirs = {vim.fn.getcwd()} })<CR>")
local builtin_telescope = require('telescope.builtin')
vim.keymap.set("n", "<leader>fw", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set("n", "<leader>ho", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set('n', '<leader>fs', builtin_telescope.lsp_document_symbols,{})
