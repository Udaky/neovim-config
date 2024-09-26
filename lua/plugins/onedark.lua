return {
  "Shatur/neovim-ayu",
  priority = 1000, -- Ensure it loads first
  config = function()
    vim.cmd("colorscheme ayu-mirage")
  end,
}
