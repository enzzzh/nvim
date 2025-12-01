local builtin = require('telescope.builtin')
requires = {{'nvim-lua/plenary.nvim'}}
-- Project Files (find_files)
vim.keymap.set('n', '<leader>f', builtin.find_files, {}) 
-- Git Files (only searches files tracked by git)
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- Project Search (grep_string with user input)
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
