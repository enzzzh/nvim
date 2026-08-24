return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {"lua", "vim", "bash", "c", "python", "rust", "css", "javascript"},
			highlight = { enable = true },
			indent = { enable = true },
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				enable_moveright = true,

				enable_afterquote = true,
				enable_check_bracket_line = true,
			})
		end,
	},
		{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim", 
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("neogit").setup({
				kind = "split", 
			})
			vim.keymap.set("n", "<leader>g", "<cmd>Neogit<cr>", { silent = true })
		end,
	},
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				rust = { "rustfmt" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
			},
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
		},
	},
		{
		"sphamba/smear-cursor.nvim",
		opts = {
			smear_between_buffers = true,
			stiffness = 0.45,
		},
	},

	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({
				sort_by = "case_sensitive",
				view = {
					width = 30,
					side = "left",
				},
				renderer = {
					group_empty = true,
					icons = {
						show = {
							git = true,
							file = true,
							folder = true,
						},
					},
				},
				filters = {
					dotfiles = false,
				},
			})
			vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
		config = function()
			require("todo-comments").setup({})
			vim.keymap.set("n", "<leader>t", ":TodoTelescope<CR>", { silent = true })
		end,
	},
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", function()
				vim.cmd("UndotreeToggle")
			end, { desc = "Toggle UndoTree Window" })
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		config = function()
			require("trouble").setup({})
			vim.keymap.set("n", "<leader>x", "<cmd>Trouble diagnostics toggle<cr>", { silent = true })
		end,
	},
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
	{
		"nvim-telescope/telescope.nvim",
		branch = "master",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
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
