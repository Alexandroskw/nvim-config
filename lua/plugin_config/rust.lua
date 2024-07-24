local function ensure_rust_analyzer_started()
        if vim.fn.exists(":RustAnalyzer") == 2 then -- Verifica si el comando existe
                if vim.g.rust_analyzer_started ~= true then
                        vim.cmd("RustAnalyzer start")
                        vim.g.rust_analyzer_started = true
                end
        end
end

-- Configuración básica de rustaceanvim
vim.g.rustaceanvim = {
        -- Configuración del servidor
        server = {
                on_attach = function(client, bufnr)
                        -- Habilitar format on save
                        vim.api.nvim_create_autocmd("BufWritePre", {
                                buffer = bufnr,
                                callback = function()
                                        vim.lsp.buf.format({ async = false })
                                end,
                        })

                        -- Configurar keymaps
                        local opts = { buffer = bufnr, noremap = true, silent = true }

                        -- Hover actions con verificación de Rust Analyzer
                        vim.keymap.set("n", "<leader>k", function()
                                ensure_rust_analyzer_started()
                                vim.cmd.RustLsp("hover actions")
                        end, opts)

                        -- Otros keymaps útiles
                        vim.keymap.set("n", "gd", function()
                                ensure_rust_analyzer_started()
                                vim.lsp.buf.definition()
                        end, opts)
                        vim.keymap.set("n", "K", function()
                                ensure_rust_analyzer_started()
                                vim.lsp.buf.hover()
                        end, opts)
                        vim.keymap.set("n", "<leader>ca", function()
                                ensure_rust_analyzer_started()
                                vim.lsp.buf.code_action()
                        end, opts)
                        vim.keymap.set("n", "<leader>rn", function()
                                ensure_rust_analyzer_started()
                                vim.lsp.buf.rename()
                        end, opts)
                end,

                -- Opciones del servidor Rust Analyzer
                settings = {
                        ["rust-analyzer"] = {
                                checkOnSave = {
                                        command = "clippy",
                                },
                                cargo = {
                                        allFeatures = true,
                                },
                        },
                },
        },

        -- Configuración de DAP (Debug Adapter Protocol)
        dap = {
                adapter = {
                        type = "executable",
                        command = "lldb-vscode",
                        name = "rt_lldb",
                },
        },
}

-- Asegúrate de que tienes un gestor de plugins instalado (como packer.nvim o vim-plug)
-- y añade rustaceanvim a tu lista de plugins

-- Autocomando para iniciar Rust Analyzer automáticamente al abrir un archivo Rust
vim.api.nvim_create_autocmd("FileType", {
        pattern = "rust",
        callback = function()
                ensure_rust_analyzer_started()
        end,
})
local function ensure_rust_analyzer_started()
        if vim.fn.exists(":RustAnalyzer") == 2 then -- Verifica si el comando existe
                if vim.g.rust_analyzer_started ~= true then
                        vim.cmd("RustAnalyzer start")
                        vim.g.rust_analyzer_started = true
                end
        end
end

-- Configuración básica de rustaceanvim
vim.g.rustaceanvim = {
        -- Configuración del servidor
        server = {
                on_attach = function(client, bufnr)
                        -- Habilitar format on save
                        vim.api.nvim_create_autocmd("BufWritePre", {
                                buffer = bufnr,
                                callback = function()
                                        vim.lsp.buf.format({ async = false })
                                end,
                        })

                        -- Configurar keymaps
                        local opts = { buffer = bufnr, noremap = true, silent = true }

                        -- Hover actions con verificación de Rust Analyzer
                        vim.keymap.set("n", "<leader>k", function()
                                ensure_rust_analyzer_started()
                                vim.cmd("RustLsp hover actions")
                        end, opts)

                        -- Otros keymaps útiles
                        vim.keymap.set("n", "gd", function()
                                ensure_rust_analyzer_started()
                                vim.lsp.buf.definition()
                        end, opts)
                        vim.keymap.set("n", "K", function()
                                ensure_rust_analyzer_started()
                                vim.lsp.buf.hover()
                        end, opts)
                        vim.keymap.set("n", "<leader>ca", function()
                                ensure_rust_analyzer_started()
                                vim.lsp.buf.code_action()
                        end, opts)
                        vim.keymap.set("n", "<leader>rn", function()
                                ensure_rust_analyzer_started()
                                vim.lsp.buf.rename()
                        end, opts)
                end,

                -- Opciones del servidor Rust Analyzer
                settings = {
                        ["rust-analyzer"] = {
                                checkOnSave = {
                                        command = "clippy",
                                },
                                cargo = {
                                        allFeatures = true,
                                },
                        },
                },
        },

        -- Configuración de DAP (Debug Adapter Protocol)
        dap = {
                adapter = {
                        type = "executable",
                        command = "lldb-vscode",
                        name = "rt_lldb",
                },
        },
}

-- Asegúrate de que tienes un gestor de plugins instalado (como packer.nvim o vim-plug)
-- y añade rustaceanvim a tu lista de plugins

-- Autocomando para iniciar Rust Analyzer automáticamente al abrir un archivo Rust
vim.api.nvim_create_autocmd("FileType", {
        pattern = "rust",
        callback = function()
                ensure_rust_analyzer_started()
        end,
})
-- local rt = require("rust-tools")
--local mason_registry = require("mason-registry")
--
--rt.setup({
--	server = {
--		capabilities = require("cmp_nvim_lsp").default_capabilities(),
--		on_attach = function(_, bufnr)
--			vim.keymap.set("n", "<Leader>k", rt.hover_actions.hover_actions, { buffer = bufnr })
--			vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
--		end,
--	},
--	tools = {
--		hover_actions = {
--			auto_focus = true,
--		},
--	},
--})
