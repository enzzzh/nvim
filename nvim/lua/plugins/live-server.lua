return {
  "ngtuonghy/live-server-nvim",
  event = "VeryLazy", -- Optional: lazy-load the plugin
  build = ":LiveServerInstall", -- Installs the local server component (if needed by the plugin)
  config = function()
    require("live-server-nvim").setup({
      port = 8080,
      open_target = "file", -- folder | file (default)
      open_command = "default_browser", -- default_browser | app | command
      extra_args = {
      },
    })
  end,
  keys = {
    { "<leader>ls", "<cmd>LiveServerToggle<CR>", desc = "Toggle Live Server" },
  },
}

