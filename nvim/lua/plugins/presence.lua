return {
  "andweeb/presence.nvim",
  event = "VeryLazy",
  config = function()
    require("presence").setup({
      auto_update         = true,                           
      neovim_image_text   = "The One True Editor",
      main_image          = "neovim",
      client_id           = "439205512425504771",       -- Use the default Discord Application ID
      log_level           = nil,                        -- Log level (nil, "debug", "info", "warn", "error")
      debounce_timeout    = 10,
      enable_line_number  = true,
      blacklist           = {},
      buttons             = true,
      show_time           = true,

      -- Rich Presence text options
      editing_text        = "Editing %s",
      file_explorer_text  = "Browsing %s",
      git_commit_text     = "Committing changes",
      plugin_manager_text = "Managing plugins",
      reading_text        = "Reading %s",
      workspace_text      = "Working on %s",
      line_number_text    = "Line %d out of %d",
    })
  end,
}
