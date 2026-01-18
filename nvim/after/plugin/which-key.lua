local which_key = require("which-key")

which_key.setup({
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
    margin = { 1, 0, 1, 0 },
    padding = { 2, 2, 2, 2 },
  },
})

which_key.register({
    { "<leader>/", group = "ToggleTerm" },
    { "<leader>a", group = "Harpoon Add" },
    { "<leader>e", group = "NvimTree" },
    { "<leader>cf", group = "Format" }, -- Updated to <leader>cf as per earlier fix
    { "<leader>gf", group = "Git Files" },
    { "<leader>lS", group = "Live Server Stop" },
    { "<leader>ls", group = "Live Server Start" },
    { "<leader>ps", group = "Project Search" },
    { "<leader>u", group = "UndoTree" },
    { "<leader>vca", desc = "Code Action" },
    -- Harpoon nav keys (added as per earlier fix)
    { "<leader>ht", group = "Harpoon Toggle" },
    { "<leader>h1", group = "Harpoon Nav 1" },
    { "<leader>h2", group = "Harpoon Nav 2" },
    { "<leader>h3", group = "Harpoon Nav 3" },
    { "<leader>h4", group = "Harpoon Nav 4" },
})
