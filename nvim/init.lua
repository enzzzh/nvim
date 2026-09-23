require("config.options")
require("config.keymaps")
require("config.lazy")
vim.cmd[[colorscheme quiet]]
vim.wo.relativenumber = yes 
vim.opt.signcolumn = "no"
vim.env.PATH = vim.fn.expand("~/.local/bin") .. ":" .. vim.env.PATH
