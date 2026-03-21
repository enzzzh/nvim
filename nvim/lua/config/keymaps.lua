vim.g.mapleader = " "

local map = vim.keymap.set

map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>h", ":nohlsearch<CR>")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<leader>ts", function()
  vim.wo.signcolumn = vim.wo.signcolumn == "yes" and "no" or "yes"
end)

map("n", "<leader>tn", function()
  vim.wo.relativenumber = not vim.wo.relativenumber
end)

map("v", "<", "<gv")
map("v", ">", ">gv")
