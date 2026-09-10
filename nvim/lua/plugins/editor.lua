return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"lua",
				"vim",
				"bash",
				"c",
				"python",
				"rust",
				"css",
				"javascript",
				"markdown",
				"markdown_inline",
				"latex",
			},
			highlight = { enable = true },
			indent = { enable = true },
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function(args)
					pcall(vim.treesitter.start, args.buf, "markdown")
				end,
			})
		end,
	},
	{
		"3rd/image.nvim",
		build = false,
		opts = {
			backend = "kitty",
			processor = "magick_cli",
			max_width = 100,
			max_height = 12,
			filetypes = { "markdown" },
		},
	},
	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
		ft = { 'markdown' },
		opts = {
			file_types = { 'markdown' },
			render_modes = { 'n', 'c', 't' },
			latex = {
				enabled = true,
				converter = 'latex2text',
				highlight = 'RenderMarkdownMath',
			},
			on = {
				attach = function()
					vim.opt_local.conceallevel = 2
				end,
			},
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
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
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
		}
	},
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				rust = { "rustfmt" },
			},
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
		},
	},
	{
		"sphamba/smear-cursor.nvim",
		opts = { smear_between_buffers = true, stiffness = 0.45 },
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup()
			vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
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
			{
				"<leader>fD",
				function()
					local actions = require("telescope.actions")
					local action_state = require("telescope.actions.state")
					local function cd_to_selected(prompt_bufnr)
						local entry = action_state.get_selected_entry()
						actions.close(prompt_bufnr)
						-- ponytail: assumes fd installed, falls back to find_files default
						local dir = entry and (entry.path or entry.value or entry[1])
						if dir and dir ~= "" then
							vim.cmd.cd(vim.fn.fnameescape(dir))
							print("cd " .. vim.fn.getcwd())
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
