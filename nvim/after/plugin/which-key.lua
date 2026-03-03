local wk = require("which-key")

wk.setup({
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  win = {
    border = "rounded",
    position = "bottom",
  },
})

wk.add({
  { "<leader>/", desc = "ToggleTerm" },
  { "<leader>a", desc = "Harpoon Add" },
  { "<leader>e", desc = "NvimTree" },
  { "<leader>cf", desc = "Format" },
  { "<leader>gf", desc = "Git Files" },
  { "<leader>ps", desc = "Project Search" },
  { "<leader>u", desc = "UndoTree" },
  { "<leader>vca", desc = "Code Action" },
  { "<leader>rn", desc = "Rename" },
  
  -- Grouped Mappings
  { "<leader>h", group = "Harpoon" },
  { "<leader>ht", desc = "Harpoon Toggle" },
  { "<leader>h1", desc = "Harpoon Nav 1" },
  { "<leader>h2", desc = "Harpoon Nav 2" },
  { "<leader>h3", desc = "Harpoon Nav 3" },
  { "<leader>h4", desc = "Harpoon Nav 4" },
  
  { "<leader>l", group = "Live Server" },
  { "<leader>ls", desc = "Live Server Start" },
  { "<leader>lS", desc = "Live Server Stop" },
})
