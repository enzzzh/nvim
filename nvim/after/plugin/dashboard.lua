local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set up the dashboard
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

-- Set the theme
alpha.setup(dashboard.opts)