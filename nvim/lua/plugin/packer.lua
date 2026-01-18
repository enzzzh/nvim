vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'goolord/alpha-nvim',
    }

    use {
        'andweeb/presence.nvim',
    }

    use {
        'rose-pine/nvim',
        as = 'rose-pine',
    }

    use {
        'bluz71/vim-moonfly-colors',
        as = 'moonfly',
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use { 'theprimeagen/harpoon' }
    use { 'mbbill/undotree' }
    use { 'neovim/nvim-lspconfig' }
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim' }
    use { 'akinsho/toggleterm.nvim' }

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip'
        }
    }

    use {
        'nvim-tree/nvim-web-devicons',
    }

    use { 'echasnovski/mini.icons' }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

    use { 'folke/which-key.nvim' }
    use { 'mfussenegger/nvim-lint' }
    use { 'mhartington/formatter.nvim' }
    use { 'numToStr/Comment.nvim' }
    use { 'L3MON4D3/LuaSnip' }

    use {
        'aurum77/live-server.nvim',
    }

    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup({})
        end
    }
end)
