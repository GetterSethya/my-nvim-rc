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
        client.server_capabilities.documentFormattingProvider = true
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

lspconfig.astro.setup {
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = true
    end,
}
lspconfig.rust_analyzer.setup {
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = true
    end,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true,
            },
        },
    },
}

-- lspconfig.emmet_language_server.setup {
--     filetypes = { "css", "html", "javascript", "javascriptreact", "typescriptreact" },
--     -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
--     -- **Note:** only the options listed in the table are supported.
--     init_options = {
--         ---@type table<string, string>
--         includeLanguages = {},
--         --- @type string[]
--         excludeLanguages = {},
--         --- @type string[]
--         extensionsPath = {},
--         --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
--         preferences = {},
--         --- @type boolean Defaults to `true`
--         showAbbreviationSuggestions = true,
--         --- @type "always" | "never" Defaults to `"always"`
--         showExpandedAbbreviation = "always",
--         --- @type boolean Defaults to `false`
--         showSuggestionsAsSnippets = false,
--         --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
--         syntaxProfiles = {},
--         --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
--         variables = {},
--     },
-- }

-- lspconfig.pyright.setup { blabla}
