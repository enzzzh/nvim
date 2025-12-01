-- Autocompletion Setup
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For snippets
        end,
    },
    mapping = cmp.mapping.preset.insert({
        -- Use CTRL-N and CTRL-P for selection, like built-in completion
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),

        -- Use <CR> (Enter) to confirm selected item
        ['<CR>'] = cmp.mapping.confirm({ select = true }), 

        -- Use <C-Space> to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(), 
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' }, -- LSP source
        { name = 'luasnip' },  -- Snippet source
        { name = 'buffer' },   -- Current buffer words
    })
})
