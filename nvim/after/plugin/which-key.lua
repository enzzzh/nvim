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
  window = {
    border = "rounded",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 2, 2, 2, 2 },
  },
})

local mappings = {
  ["<leader>"] = {
    e = { name = "NvimTree" },
    f = { name = "Format" },
    ps = { name = "Project Search" },
    gf = { name = "Git Files" },
    a = { name = "Harpoon Add" },
    u = { name = "UndoTree" },
    ls = { name = "Live Server Start" },
    lS = { name = "Live Server Stop" },
    ["/"] = { name = "ToggleTerm" },
    v = {
        c = {a = "Code Action"}
    },
  },
}

which_key.register(mappings)
