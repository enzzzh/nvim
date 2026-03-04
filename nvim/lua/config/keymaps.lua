vim.g.mapleader = " "

local keymap = vim.keymap

-- Existing remap
keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Common LazyVim-like keymaps
keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>q", ":q<CR>")
keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- Moving lines in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keeping search results centered
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
