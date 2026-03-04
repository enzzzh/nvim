return {
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { 
        "lua", "python", "rust", "javascript", "typescript", 
        "vim", "vimdoc", "query", "bash", "html", "css" 
      },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter").setup(opts)
    end,
  },

  -- Harpoon
  {
    "theprimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")
      vim.keymap.set("n", "<leader>a", mark.add_file)
      vim.keymap.set("n", "<leader>ht", ui.toggle_quick_menu)
      vim.keymap.set("n", "<leader>h1", function() ui.nav_file(1) end)
      vim.keymap.set("n", "<leader>h2", function() ui.nav_file(2) end)
      vim.keymap.set("n", "<leader>h3", function() ui.nav_file(3) end)
      vim.keymap.set("n", "<leader>h4", function() ui.nav_file(4) end)
    end,
  },

  -- Undotree
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndoTreeToggle)
    end,
  },

  -- Comment.nvim
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- Nvim-autopairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
        disable_filetype = { "TelescopePrompt", "vim" },
      })
    end,
  },

  -- Formatter
  {
    "mhartington/formatter.nvim",
    config = function()
      require("formatter").setup({
        filetype = {
          lua = { require("formatter.filetypes.lua").stylua },
          python = { require("formatter.filetypes.python").black },
          rust = { require("formatter.filetypes.rust").rustfmt },
        },
      })
      vim.keymap.set("n", "<leader>cf", ":Format<CR>", { silent = true })
    end,
  },

  -- Nvim-lint
  {
    "mfussenegger/nvim-lint",
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        lua = { "luacheck" },
        python = { "pylint" },
        rust = { "rustc" },
      }
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },

  -- Live Server
  {
    "aurum77/live-server.nvim",
    config = function()
      vim.keymap.set("n", "<leader>ls", ":LiveServerStart<CR>")
      vim.keymap.set("n", "<leader>lS", ":LiveServerStop<CR>")
    end,
  },
}
