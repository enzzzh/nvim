local lspconfig = require('lspconfig')

-- Diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = "💡", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
end

require('mason').setup({})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',
        'pyright',
        'rust_analyzer',
    },
    automatic_installation = true,
    handlers = {
        function(server_name)
            lspconfig[server_name].setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
        end,
        lua_ls = function()
            lspconfig.lua_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                root_dir = lspconfig.util.root_pattern(".git", "init.lua", "lua"),
                settings = {
                    Lua = {
                        runtime = { version = 'LuaJIT' },
                        diagnostics = {
                            globals = { 'vim' },
                        },
                        workspace = {
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.stdpath("config") .. "/lua"] = true,
                            },
                            checkThirdParty = false,
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })
        end,
        pyright = function()
            lspconfig.pyright.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    python = {
                        analysis = {
                            inlayHints = {
                                functionReturnTypes = true,
                            },
                        },
                    },
                },
            })
        end,
        rust_analyzer = function()
            lspconfig.rust_analyzer.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    ["rust-analyzer"] = {
                        inlayHints = {
                            parameterHints = { enable = true },
                            chainingHints = { enable = true },
                            closingBraceHints = { enable = true, minLines = 25 },
                        },
                    },
                },
            })
        end,
    }
})
