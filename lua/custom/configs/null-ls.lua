local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

    -- webdev stuff
    b.formatting.prettier.with {
        filetypes = { "css", "html", "javascript", "typescript", "json", "yaml" },
        dynamic_command = function()
            return "prettier"
        end,
    }, -- so prettier works only on these filetypesnullprettier

    -- Lua
    b.formatting.stylua,

    -- cpp
    b.formatting.clang_format,

    --null_ls.builtins.formatting.prettier.with({
    --extra_filetypes = {"svelte"},
    --}),
}

null_ls.setup {
    debug = true,
    sources = sources,
}
