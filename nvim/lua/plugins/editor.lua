return {
	-- Treesitter (Combined into a single clean spec)
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"bash",
				"c",
				"python",
				"rust",
				"latex",
				"bibtex",
			},
			highlight = { enable = true },
			indent = { enable = true },
		},
	},

	-- Vimwiki
	{
		"vimwiki/vimwiki",
		event = "VimEnter",
		init = function()
			vim.g.vimwiki_list = {
				{
					path = "~/vimwiki/",
					syntax = "default",
					ext = ".wiki",
				},
			}
			vim.g.vimwiki_global_ext = 0
		end,
		keys = {
			{ "<leader>ww", "<cmd>VimwikiIndex<cr>", desc = "Vimwiki Index" },
			{ "<leader>w<leader>w", "<cmd>VimwikiMakeDiaryNote<cr>", desc = "Vimwiki Diary" },
		},
	},

	-- Netrw setup (Native file explorer replacing NvimTree)
	{
		"nvim-lua/plenary.nvim", -- dummy wrapper to load netrw keymap & options cleanly
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.netrw_banner = 0
			vim.g.netrw_winsize = 25
			vim.keymap.set("n", "<leader>e", "<cmd>Explore<CR>", { silent = true, desc = "Toggle Netrw" })
		end,
	},

	-- Autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	-- LazyGit
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},

	-- Conform (Formatting)
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				rust = { "rustfmt" },
				tex = { "latexindent" },
			},
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
		},
	},

	-- Todo Comments
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},

	-- Undotree
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},

	-- Trouble
	{
		"folke/trouble.nvim",
		opts = {},
	},

	-- Harpoon
	{
		"theprimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")
			vim.keymap.set("n", "<leader>a", mark.add_file)
			vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)
		end,
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		branch = "master",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files" },
			{ "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
			{ "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Find buffers" },
			{ "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Help tags" },
			{ "<leader>fo", function() require("telescope.builtin").oldfiles() end, desc = "Recent files" },
			{ "<leader>fr", function() require("telescope.builtin").resume() end, desc = "Resume last picker" },
			{ "<leader>fk", function() require("telescope.builtin").keymaps() end, desc = "Find keymaps" },
			{ "<leader>fc", function() require("telescope.builtin").commands() end, desc = "Find commands" },
			{ "<leader>fd", function() require("telescope.builtin").diagnostics() end, desc = "Find diagnostics" },
			cd " .. vim.fn.getcwd())
						end
					end
					require("telescope.builtin").find_files({
						find_command = { "fd", "--type", "d", "--hidden", "--exclude", ".git" },
						prompt_title = "Find directory and cd",
						attach_mappings = function(_, map)
							map("i", "<CR>", cd_to_selected)
							map("n", "<CR>", cd_to_selected)
							return true
						end,
					})
				end,
				desc = "Find directory and cd",
			},
		},
	},

	-- Linter
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local lint = require("lint")
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
