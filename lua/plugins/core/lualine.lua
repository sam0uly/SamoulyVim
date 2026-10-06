local c = {
  bg = "#2D2C36",
  bg_dark = "#201F26",
  charcoal = "#3A3943",
  fg = "#BFBCC8",
  fg_dim = "#858392",
  purple = "#6B50FF",
  mint = "#00FFB2",
  orange = "#FF985A",
  red = "#EB4268",
  yellow = "#F5EF34",
  pink = "#FF60FF",
  hazy = "#8B75FF",
  butter = "#FFFAF1",
  cheeky = "#FF79D0",
  teal = "#0ADCD9",
  blue = "#00A4FF",
}

local block = { fg = c.bg, gui = "bold" }

local function mode_block(bg)
  return { fg = c.butter, bg = bg, gui = "bold" }
end

local b_section = { fg = c.teal, bg = c.charcoal }
local c_section = { fg = c.purple, bg = c.bg_dark }

---@type LazySpec
return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    init = function()
      vim.opt.laststatus = 3
    end,
    config = function(_, opts)
      require("lualine").setup(opts)
      vim.opt.fillchars:append({ stl = "╱", stlnc = "╱" })
    end,
    opts = function()
      local icons = LazyVim.config.icons

      return {
        options = {
          theme = {
            normal = { a = mode_block(c.purple), b = b_section, c = c_section },
            insert = { a = mode_block(c.mint), b = b_section, c = c_section },
            visual = { a = mode_block(c.orange), b = b_section, c = c_section },
            replace = { a = mode_block(c.red), b = b_section, c = c_section },
            command = { a = mode_block(c.cheeky), b = b_section, c = c_section },
            inactive = {
              a = { fg = c.fg_dim, bg = c.charcoal },
              b = { fg = c.fg_dim, bg = c.charcoal },
              c = { fg = c.fg_dim, bg = c.bg_dark },
            },
          },
          globalstatus = true,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = { statusline = { "alpha", "ministarter" } },
        },
        sections = {
          lualine_a = {
            { "mode", padding = { left = 1, right = 1 } },
          },
          lualine_b = {
            { "branch", icon = "", padding = { left = 1, right = 1 } },
            { "diff", padding = { left = 0, right = 1 } },
          },
          lualine_c = {
            LazyVim.lualine.root_dir({
              color = function()
                return { fg = c.hazy }
              end,
            }),
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            {
              LazyVim.lualine.pretty_path(),
              color = { fg = c.butter, bg = c.bg_dark },
              padding = { left = 1, right = 1 },
            },
          },
          lualine_x = {
            {
              function()
                return " "
              end,
              color = function()
                local status = require("sidekick.status").get()
                if status then
                  return status.kind == "Error" and "DiagnosticError" or status.busy and "DiagnosticWarn" or "Special"
                end
              end,
              cond = function()
                return require("sidekick.status").get() ~= nil
              end,
            },
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            {
              "lsp",
              icon = "󰰎",
              color = { fg = c.blue },
              padding = { left = 1, right = 1 },
              separator = "",
            },
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = { fg = c.orange, gui = "bold" },
            },
          },
          lualine_y = {
            {
              function()
                local s = vim.fn.searchcount({ maxcount = 999, timeout = 100 })
                if s and s.total and s.total > 0 then
                  return string.format("/%d %d", s.total, s.current)
                end
                return ""
              end,
              cond = function()
                return vim.v.hlsearch ~= 0
              end,
              color = { fg = c.bg, bg = c.yellow, gui = "bold" },
              padding = { left = 1, right = 1 },
            },
            {
              function()
                return "REC " .. vim.fn.reg_recording()
              end,
              cond = function()
                return vim.fn.reg_recording() ~= ""
              end,
              color = { fg = c.bg, bg = c.red, gui = "bold" },
              padding = { left = 1, right = 1 },
            },
            { "progress", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 1, right = 1 } },
          },
          lualine_z = {
            {
              function()
                return " " .. os.date("%H:%M")
              end,
              color = { fg = c.butter, bg = c.pink, gui = "bold" },
              padding = { left = 1, right = 1 },
            },
          },
        },
        extensions = {
          "neo-tree",
          "nvim-tree",
          "lazy",
          "fzf",
          {
            filetypes = { "snacks_dashboard", "dashboard" },
            sections = {
              lualine_a = {},
              lualine_b = {},
              lualine_x = {},
              lualine_y = {},
              lualine_z = {},
              lualine_c = {
                {
                  function()
                    return string.rep("╱", vim.api.nvim_win_get_width(0))
                  end,
                  color = { fg = c.purple, bg = c.bg },
                  padding = { left = 0, right = 0 },
                },
              },
            },
          },
        },
      }
    end,
  },

  {
    "christopher-francisco/tmux-status.nvim",
    enabled = true,
  },
}
