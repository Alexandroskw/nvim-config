require("mason").setup()
require("mason-lspconfig").setup({
        ensure_installed = {
                "lua_ls",
                "pyright",
        },
})

require("lspconfig").lua_ls.setup({})
-- require("lspconfig").rust_analyzer.setup{}
require("lspconfig").pyright.setup({})
