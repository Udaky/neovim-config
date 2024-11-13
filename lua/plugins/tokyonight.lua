-- return {
--   "Shatur/neovim-ayu",
--   priority = 1000, -- Ensure it loads first
--   config = function()
--     vim.cmd("colorscheme ayu-mirage")
--   end,
-- }

return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme tokyonight-moon")
  end,
}
