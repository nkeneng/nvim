-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- fix for github copilot not working perfectly with clangd server
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

local language_servers = require("lspconfig").util.available_servers()
for _, ls in ipairs(language_servers) do
  if ls == "clangd" then
    capabilities.offsetEncoding = { "utf-16" }
  end
  require("lspconfig")[ls].setup {
    capabilities = capabilities
  }
end
