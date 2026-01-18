require('Comment').setup({
    -- Add a space between comment and the line
    padding = true,
    -- Whether the comment should be indented
    indent = true,
    -- Toggle keymap (normal mode)
    toggler = {
        line = '<gc>',
        block = '<gbc>',
    },
    -- Operator keymap (visual mode)
    opleader = {
        line = '<gc>',
        block = '<gbc>',
    },
    -- Extra keymaps
    extra = {
        -- Extend basic solution for the block comment toggle
        block = '<gb>',
    },
    -- Enables mapping the toggle function to a key.
    -- set to false, if you are planning to use it in help files.
    enable_extra = true,
})