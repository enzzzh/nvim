require ("plugin.remap")
require ("plugin.color")
require ("plugin.packer")
vim.opt.swapfile = false
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  command = "lua ColorMyPencils()",
})

