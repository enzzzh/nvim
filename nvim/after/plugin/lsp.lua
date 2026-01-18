local lspconfig = require('lspconfig')

-- Diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = "💡", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = true,
  signs = {
    active = signs,
  },
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

-- This hook is called when a language server attaches to a buffer.
local on_attach = function(client, bufnr)
    -- OPTIONAL: Add common keymaps here.
    -- The 'opts' ensures the keymaps are local to the current buffer (bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- Keymaps for LSP functions (use your preferred keymaps)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)       -- Go to Definition
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)             -- Show Hover Documentation
    vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts) -- Code Action
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)   -- Rename
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)     -- Go to Previous Diagnostic
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)     -- Go to Next Diagnostic

    -- Set omnifunc for CTRL-X CTRL-O completion
    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
end

-- 1. Setup Mason
require('mason').setup({
    -- Ensure Mason installs LSPs into a clean location.
})

-- 2. Setup nvim-cmp capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- 3. Setup mason-lspconfig
require('mason-lspconfig').setup({
    -- This array specifies the LSPs to install and set up automatically.
    ensure_installed = {
        'lua_ls',
        'pyright',
        'rust_analyzer',
    },

    -- This handler automatically sets up any installed server using nvim-lspconfig
    handlers = {
        function(server_name)
            lspconfig[server_name].setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
        end,
        -- Special handler for lua_ls to enable Neovim runtime help
        lua_ls = function()
            lspconfig.lua_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = { version = 'LuaJIT' },
                        diagnostics = {
                            globals = { 'vim' },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
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
                            parameterHints = {
                                enable = true,
                            },
                            chainingHints = {
                                enable = true,
                            },
                            closingBraceHints = {
                                enable = true,
                                minLines = 25,
                            },
                        },
                    },
                },
            })
        end,
    }
})
