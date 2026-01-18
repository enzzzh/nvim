local formatter = require("formatter")

formatter.setup({
  filetype = {
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
    python = {
      require("formatter.filetypes.python").black,
    },
    rust = {
      require("formatter.filetypes.rust").rustfmt,
    },
  }
})

vim.api.nvim_set_keymap("n", "<leader>f", ":Format<CR>", { noremap = true, silent = true })
