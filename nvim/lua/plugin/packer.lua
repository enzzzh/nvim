vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
	use{
    		'nvim-telescope/telescope.nvim', tag = '0.1.x',
    		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use({
	  'rose-pine/nvim',
	  as = 'rose-pine',
	  config = function()
	  vim.cmd('colorscheme rose-pine')	  
	  end
	})

	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use ('theprimeagen/harpoon')
	use ('mbbill/undotree')
	use 'neovim/nvim-lspconfig'   -- The LSP client configuration manager
    	use 'williamboman/mason.nvim'         -- Language Server installer
    	use 'williamboman/mason-lspconfig.nvim' -- Connects Mason to nvim-lspconfig
	use 'akinsho/toggleterm.nvim'
    	use 'hrsh7th/nvim-cmp'        
	use 'hrsh7th/cmp-nvim-lsp'   
	use 'L3MON4D3/LuaSnip'       
	use {
    	'windwp/nvim-autopairs', 
    	config = function()
        require('nvim-autopairs').setup({})
    end
}
end)
