require("config.options")
require("config.keymaps")
require("config.lazy")
vim.wo.relativenumber = not vim.wo.relativenumber
vim.opt.signcolumn = "no"
vim.env.PATH = vim.fn.expand("~/.local/bin") .. ":" .. vim.env.PATH
vim.cmd.colorscheme("lunaperche")
-- Netrw Configuration (Native File Explorer)
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.keymap.set("n", "<leader>e", "<cmd>Explore<CR>", { desc = "Toggle Netrw" })

vim.keymap.set("n", "<leader>lg", "<cmd>tabnew | term lazygit<CR>a", { desc = "LazyGit" })

vim.keymap.set("n", "<leader>qo", "<cmd>copen<CR>", { desc = "Open Quickfix" })
vim.keymap.set("n", "<leader>qc", "<cmd>cclose<CR>", { desc = "Close Quickfix" })
vim.keymap.set("n", "]q", "<cmd>cnext<CR>", { desc = "Next Quickfix item" })
vim.keymap.set("n", "[q", "<cmd>cprev<CR>", { desc = "Previous Quickfix item" })

--  (Replaces conform.nvim if using LSP)
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		vim.lsp.buf.format({ timeout_ms = 500 })
	end,
})

-- Native Path Searching (Optionally replaces Telescope for local files)
vim.opt.path:append("**")
vim.opt.wildignore:append({ "*/.git/*", "*/node_modules/*", "*/build/*", "*.o" })
