return {
  {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("lackluster")
      local hl = { "Normal", "NormalFloat", "StatusLine", "StatusLineNC", "NvimTreeNormal", "NvimTreeNormalNC" }
      for _, group in ipairs(hl) do
        vim.api.nvim_set_hl(0, group, { bg = "none" })
      end
    end,
  },
}
