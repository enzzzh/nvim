local lspconfig = require('lspconfig')

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
        'lua_ls', -- For Lua/Neovim config
        'pyright', -- For Python
        'rust_analyzer', -- For Rust
        'tsserver', -- For TypeScript/JavaScript
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
                            library = {
                                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                                [vim.fn.stdpath('data') .. '/lazy/mason/packages/lua-language-server/share/runtime-lsp/library'] = true,
                            },
                        },
                    },
                },
            })
        end,
    }
})
