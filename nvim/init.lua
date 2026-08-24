require("config.options")
require("config.keymaps")
require("config.lazy")
vim.wo.relativenumber = not vim.wo.relativenumber
vim.opt.signcolumn = "no"
vim.env.PATH = vim.fn.expand("~/.local/bin") .. ":" .. vim.env.PATH
vim.cmd.colorscheme("lunaperche")
