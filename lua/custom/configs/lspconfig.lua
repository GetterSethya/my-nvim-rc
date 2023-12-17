local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"


-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "clangd" }

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

lspconfig.tsserver.setup {
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
    end,
}

lspconfig.svelte.setup {
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = true
    end,
}

lspconfig.gopls.setup {
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = true
    end,
}

-- lspconfig.pyright.setup { blabla}
