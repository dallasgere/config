return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        -- packages I need
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")

        -- Set up LSP capabilities
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        -- Set up fidget (loading spinner)
        require("fidget").setup({})

        -- Set up Mason (LSP installer)
        require("mason").setup()

        -- Configure Mason-LSPConfig
        require("mason-lspconfig").setup({
            ensure_installed = {
                "html",
                "htmx"
            },
            handlers = {
                -- Default handler for all LSPs
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                -- Custom handler for Lua language server
                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,

                -- html handler
                ["html"] = function()
                    require("lspconfig").html.setup {
                        capabilities = capabilities,
                        filetypes = {"html", "htmldjango"},
                    }
                end,

                -- Custom handler for HTMX language server
                ["htmx"] = function()
                    require("lspconfig").htmx.setup {
                        capabilities = capabilities,
                    }
                end,
            }
        })

        -- Setup nvim-cmp for autocompletion
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<S-TAB>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<TAB>'] = cmp.mapping.select_next_item(cmp_select),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                    { name = 'buffer' },
                })
        })

        -- Configure diagnostic display
        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}

