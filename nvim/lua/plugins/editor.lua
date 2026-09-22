return {
	-- Syntax & Parsing
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "lua", "vim", "vimdoc", "bash", "c", "python", "rust", "latex" },
			highlight = { enable = true },
			indent = { enable = true },
		},
	},

	-- Wiki & Note Taking
	{
		"vimwiki/vimwiki",
		event = "VimEnter",
		init = function()
			vim.g.vimwiki_list = { { path = "~/vimwiki/", syntax = "default", ext = ".wiki" } }
			vim.g.vimwiki_global_ext = 0
		end,
		keys = {
			{ "<leader>ww", "<cmd>VimwikiIndex<cr>", desc = "Vimwiki Index" },
			{ "<leader>w<leader>w", "<cmd>VimwikiMakeDiaryNote<cr>", desc = "Vimwiki Diary" },
		},
	},

	-- Fuzzy Finder (Keep if essential; otherwise dropped for native :find)
	{
		"nvim-telescope/telescope.nvim",
		branch = "master",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files" },
			{ "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
			{ "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Find buffers" },
		},
	},

	-- Auto Closing Pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function() require("nvim-autopairs").setup({}) end,
	},

	},
}
