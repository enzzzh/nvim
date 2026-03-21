return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      require("telescope").setup({
        defaults = {
          borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
          layout_config = { horizontal = { preview_width = 0.5 } },
          preview = { treesitter = false },
        },
      })
      vim.keymap.set("n", "<leader>f", builtin.find_files)
      vim.keymap.set("n", "<leader>gf", builtin.git_files)
      vim.keymap.set("n", "<leader>ps", function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end)
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "echasnovski/mini.icons" },
    config = function()
      local colors = { blue = "#80a0ff", cyan = "#79dac8", black = "#080808", white = "#c6c6c6", red = "#ff5189", violet = "#d183ff", grey = "#303030" }
      local bubbles = {
        normal = { a = { fg = colors.black, bg = colors.violet }, b = { fg = colors.white, bg = colors.grey }, c = { fg = colors.white } },
        insert = { a = { fg = colors.black, bg = colors.blue } },
        visual = { a = { fg = colors.black, bg = colors.cyan } },
        replace = { a = { fg = colors.black, bg = colors.red } },
        inactive = { a = { fg = colors.white, bg = colors.black }, b = { fg = colors.white, bg = colors.black }, c = { fg = colors.white } },
      }
      require("lualine").setup({
        options = { theme = bubbles, component_separators = "", section_separators = { left = "", right = "" }, globalstatus = true },
        sections = {
          lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
          lualine_b = { "filename", "branch" },
          lualine_c = { "%=" },
          lualine_y = { "filetype", "progress" },
          lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
        },
      })
    end,
  },
  { "rcarriga/nvim-notify", opts = { background_colour = "#000000" } },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    opts = {
      lsp = { override = { ["vim.lsp.util.convert_input_to_markdown_lines"] = true, ["vim.lsp.util.stylize_markdown"] = true, ["cmp.entry.get_documentation"] = true } },
      presets = { bottom_search = true, command_palette = true, long_message_to_split = true, inc_rename = false, lsp_doc_border = true },
    },
  },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = { indent = { char = "│" }, scope = { enabled = false } } },
  {
    "goolord/alpha-nvim",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.header.val = { " ", " ", " ", " ", "   M I N I M A L ", " ", " ", " " }
      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find File", ":Telescope find_files <CR>"),
        dashboard.button("r", "  Recent Files", ":Telescope oldfiles <CR>"),
        dashboard.button("e", "  New File", ":ene <BAR> startinsert <CR>"),
        dashboard.button("q", "  Quit", ":qa <CR>"),
      }
      dashboard.opts.opts.noautocmd = true
      alpha.setup(dashboard.opts)
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "echasnovski/mini.icons" },
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = { width = 30 },
        renderer = { group_empty = true, icons = { show = { git = true } } },
        filters = { dotfiles = true },
      })
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup({ win = { border = "rounded" } })
    end,
  },
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
  { "echasnovski/mini.icons", version = "*" },
}
