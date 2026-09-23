return {
	{
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "lua", "vim", "vimdoc", "bash", "c", "python", "rust", "latex" },
		highlight = { enable = true },
		indent = { enable = true },
	},
},
{
  'Julian/lean.nvim',
  event = { 'BufReadPre *.lean', 'BufNewFile *.lean' },

  dependencies = {
    -- optional dependencies:

    -- 'nvim-telescope/telescope.nvim', -- for Lean-specific pickers
    -- 'andymass/vim-matchup',          -- for enhanced % motion behavior
    -- 'andrewradev/switch.vim',        -- for switch support
    -- 'tomtom/tcomment_vim',           -- for commenting
  },

  ---@type lean.Config
  opts = { -- see the manual for full configuration options
    mappings = true,
  }
},
{
	"lervag/vimtex",
	lazy = false,
	init = function()
		vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_quickfix_mode = 0
		vim.g.vimtex_compiler_method = "latexmk"
	end,
},
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "iurimateus/luasnip-latex-snippets.nvim" },
		config = function()
			require("luasnip-latex-snippets").setup() -- set opts = {} for lang -> setup({ use_treesitter = true })
		end,
	},
	{
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	ft = { "markdown" },
	opts = {},
},

	{
		"vimwiki/vimwiki",
		event = "VimEnter",
		init = function()
			vim.g.vimwiki_list = { { path = "~/vimwiki/", syntax = "default", ext = ".wiki" } }
			vim.g.vimwiki_global_ext = 0
		end,
		keys = {
			{ "<leader>ww",         "<cmd>VimwikiIndex<cr>",         desc = "Vimwiki Index" },
			{ "<leader>w<leader>w", "<cmd>VimwikiMakeDiaryNote<cr>", desc = "Vimwiki Diary" },
		},
	},

	{
		"nvim-telescope/telescope.nvim",
		branch = "master",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files" },
			{ "<leader>fg", function() require("telescope.builtin").live_grep() end,  desc = "Live grep" },
			{ "<leader>fb", function() require("telescope.builtin").buffers() end,    desc = "Find buffers" },
		},
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function() require("nvim-autopairs").setup({}) end,
	},

}
