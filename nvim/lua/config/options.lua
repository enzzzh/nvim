local opt = vim.opt

opt.clipboard = "unnamedplus"
opt.swapfile = false
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.scrolloff = 12
opt.sidescrolloff = 8
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.hlsearch = false
opt.incsearch = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.updatetime = 50
opt.completeopt = "menu,menuone,noselect"
opt.mouse = "a"
opt.laststatus = 3
opt.showmode = false
opt.cursorline = true
opt.fillchars = { eob = " " }
opt.shortmess:append("Ic")

-- vim.cmd.colorscheme("vim")
