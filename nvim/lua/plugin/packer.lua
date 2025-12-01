-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- The telescope script 
	use{
    		'nvim-telescope/telescope.nvim', tag = '0.1.x',
    		requires = { {'nvim-lua/plenary.nvim'} }
	}
--	use({
--		"bluz71/vim-moonfly-colors",
--		as = "moonfly",
--		config = function()
--		vim.cmd('colorscheme moonfly')
--		end
--	})	
 	use({
	  'rose-pine/nvim',
	  as = 'rose-pine',
	  config = function()
	  vim.cmd('colorscheme rose-pine')	  
	  end
	})

	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use ('nvim-treesitter/playground')
	use ('theprimeagen/harpoon')
	use ('mbbill/undotree')
	use 'neovim/nvim-lspconfig'   -- The LSP client configuration manager
    	use 'williamboman/mason.nvim'         -- Language Server installer
    	use 'williamboman/mason-lspconfig.nvim' -- Connects Mason to nvim-lspconfig
	use 'akinsho/toggleterm.nvim'
    -- Autocompletion (Required for a full IDE experience)
    	use 'hrsh7th/nvim-cmp'        -- Completion engine
    	use 'hrsh7th/cmp-nvim-lsp'    -- Source for LSP suggestions
    	use 'L3MON4D3/LuaSnip'        -- Snippet engine
	use {
    	'windwp/nvim-autopairs', 
    	config = function()
        require('nvim-autopairs').setup({})
    end
}
end)
