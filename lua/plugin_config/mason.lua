require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		-- "rust_analyzer",
        "pyright",
	}
})

require("lspconfig").lua_ls.setup{}
-- require("lspconfig").rust_analyzer.setup{}
require("lspconfig").pyright.setup{}
require("lspconfig").ruff.setup{}
