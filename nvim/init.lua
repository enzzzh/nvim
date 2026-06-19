require("config.options")
require("config.keymaps")
require("config.lazy")
vim.wo.relativenumber = not vim.wo.relativenumber
vim.opt.signcolumn = "no"

vim.cmd.colorscheme("lunaperche")
