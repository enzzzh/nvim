return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({
      enable_moveright = true,
      enable_afterquote = true,
      enable_check_bracket_line = false,
    })
  end,
}
