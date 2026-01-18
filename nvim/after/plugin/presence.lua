local presence = require("presence")

presence.setup({
    -- General options
    auto_update = true,
    neovim_image_text = "The One True Editor",
    main_image = "neovim",
    client_id = "793271441293967371",
    log_level = "debug",
    debounce = 10,
    enable_line_number = true,
    blacklist = {},

    -- Rich Presence text options
    editing_text = "Editing %s",
    file_browser_text = "Browsing %s",
    git_commit_text = "Committing changes",
    plugin_manager_text = "Managing plugins",
    reading_text = "Reading %s",
    workspace_text = "Working on %s",
    line_number_text = "Line %s out of %s",
})
