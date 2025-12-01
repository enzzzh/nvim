-- Set up the toggleterm plugin
require("toggleterm").setup({
    -- The keybind used to toggle the terminal
    open_mapping = [[<leader>/]], 
    
    -- The size (height) of the terminal when it's a horizontal split
    size = 15, 
    
    -- Sets the default position/style for the terminal:
    -- 'horizontal' will be a split at the bottom (like VSCode)
    -- 'float' will be a centered popup window
    direction = 'horizontal', 
    
    -- Optional: If you use the float direction, this ensures it looks nice.
    float_opts = {
        border = 'curved',
    },
    
    -- Optional: Disable the default name in the tabline
    hide_numbers = true, 
})

-- If you want to use the keymap for other modes, you can also define it here
-- The 'open_mapping' above is usually sufficient for a quick toggle.

-- Example of how to manually map it if 'open_mapping' doesn't work:
-- vim.api.nvim_set_keymap('n', '<leader>/', '<Cmd>ToggleTerm<CR>', {noremap = true, silent = true})
