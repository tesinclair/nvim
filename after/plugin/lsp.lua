local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- here you can setup the language servers
require("mason").setup()
require("mason-lspconfig").setup()

-- After setting up mason-lspconfig you may set up servers via lspconfig
require("lspconfig").lua_ls.setup {}
require("lspconfig").ccls.setup {}
require("lspconfig").cmake.setup {}
require("lspconfig").emmet_language_server.setup {}
require("lspconfig").tsserver.setup {}
require("lspconfig").intelephense.setup {}
require("lspconfig").pylyzer.setup {}

