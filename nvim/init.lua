-- Bootstrap Packer
local packer_bootstrap = false
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = true
  vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd('packadd packer.nvim')
end

-- Load and setup Packer plugins from plugin.packer.lua
require('plugin.packer')

if packer_bootstrap then
  require('packer').sync()
end

vim.opt.clipboard = "unnamedplus"
require ("plugin.remap")
require ("core.colors").set_colorscheme()
vim.opt.swapfile = false

vim.cmd([[
  augroup PackerReload
    autocmd!
    autocmd BufWritePost init.lua source <afile>
    autocmd BufWritePost */nvim/lua/plugin/packer.lua source <afile> | PackerCompile
  augroup end
]])
