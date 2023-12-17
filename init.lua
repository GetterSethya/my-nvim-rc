require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
    dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
    require("core.bootstrap").gen_chadrc_template()
    require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.wo.relativenumber = true
vim.opt.breakindent = true
vim.opt.formatoptions:remove "t"
vim.opt.linebreak = true

vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>",{ noremap = true, silent = true })
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-p>", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-n>", "<cmd>lua vim.diagnostic.goto_next()<cr>", { noremap = true, silent = true })

-- Set transparent background
-- vim.api.nvim_set_hl(0,"Normal",{bg="none"})
-- vim.api.nvim_set_hl(0,"NormalFloat",{bg="none"})
