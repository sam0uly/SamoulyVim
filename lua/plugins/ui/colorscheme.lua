---@type LazySpec

local last_file = vim.fn.stdpath("data") .. "/last_colorscheme"
local lines = vim.fn.filereadable(last_file) == 1 and vim.fn.readfile(last_file) or {}
local last_colorscheme = lines[1] and lines[1]:gsub("%s+", "") or nil

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = last_colorscheme or "tailsvim",
    },
  },
  {
    "Ferouk/bearded-nvim",
    name = "bearded",
    priority = 1000,
    build = function()
      -- Generate helptags so :h bearded-theme works
      local doc = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy", "bearded", "doc")
      pcall(vim.cmd, "helptags " .. doc)
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = true,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    opts = {
      term_colors = true,
      color_overrides = {
        mocha = {
          base = "#05070f",
          mantle = "#05070f",
          crust = "#05070f",
        },
      },
    },
  },
  {
    "uhs-robert/oasis.nvim",
    lazy = true,
  },
  {
    "dasupradyumna/midnight.nvim",
    lazy = true,
  },
  {
    "RRethy/base16-nvim",
    lazy = false,
  },
}
