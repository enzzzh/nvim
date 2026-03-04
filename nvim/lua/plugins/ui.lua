return {
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      require("telescope").setup({
        defaults = {
          preview = {
            treesitter = false,
          },
        },
      })
      vim.keymap.set("n", "<leader>f", builtin.find_files, {})
      vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
      vim.keymap.set("n", "<leader>ps", function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end)
    end,
  },

  -- Lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          icons_enabled = true,
          globalstatus = true,
        },
      })
    end,
  },

  -- Alpha (Dashboard)
  {
    "goolord/alpha-nvim",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.header.val = {
        "███╗   ██╗ ███████╗██╗   ██╗██╗████████╗",
        "████╗  ██║ ██╔════╝██║   ██║██║╚══██╔══╝",
        "██╔██╗ ██║ █████╗  ██║   ██║██║   ██║   ",
        "██║╚██╗██║ ██╔══╝  ██║   ██║██║   ██║   ",
        "██║ ╚████║ ███████╗╚██████╔╝██║   ██║   ",
        "╚═╝  ╚═══╝ ╚══════╝ ╚═════╝ ╚═╝   ╚═╝   ",
      }
      dashboard.section.buttons.val = {
        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
        dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("q", "  Quit", ":qa <CR>"),
      }
      alpha.setup(dashboard.opts)
    end,
  },

  -- Nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = { width = 30 },
        renderer = {
          group_empty = true,
          icons = { show = { git = true } },
        },
        filters = { dotfiles = true },
      })
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
    end,
  },

  -- Which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({
        win = { border = "rounded", position = "bottom" },
      })
      wk.add({
        { "<leader>/", desc = "ToggleTerm" },
        { "<leader>a", desc = "Harpoon Add" },
        { "<leader>e", desc = "NvimTree" },
        { "<leader>c", group = "Code" },
        { "<leader>ca", desc = "Code Action" },
        { "<leader>cf", desc = "Format" },
        { "<leader>cr", desc = "Rename" },
        { "<leader>f", desc = "Find File" },
        { "<leader>gf", desc = "Git Files" },
        { "<leader>ps", desc = "Project Search" },
        { "<leader>u", desc = "UndoTree" },
        { "<leader>h", group = "Harpoon" },
        { "<leader>l", group = "Live Server" },
      })
    end,
  },

  -- Toggleterm
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<leader>/]],
        size = 15,
        direction = "horizontal",
        float_opts = { border = "curved" },
        hide_numbers = true,
      })
    end,
  },

  -- Presence.nvim
  { "andweeb/presence.nvim" },

  -- Mini.icons
  { "echasnovski/mini.icons", version = "*" },
}
