-- Configure LSP
local nvim_lsp = require "lspconfig"
-- local on_attach = function(client, bufnr)
-- end

-- Enable following language servers
local servers = {
  tsserver = {},
  lua_ls = {},
  rust_analyzer = {
    diagnostics = {
      enable = true;
    },
  },
}

-- add additional completion capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}
mason_lspconfig.setup_handlers {
  function(server_name)
    nvim_lsp[server_name].setup {
      capabilities = capabilities,
      -- on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end
}
