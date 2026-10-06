---@type LazySpec
-- NOTE: Tabline / Bufferline UI

local c = {
  bg = "#2D2C36",
  bg_dark = "#201F26",
  charcoal = "#3A3943",
  fg = "#BFBCC8",
  fg_dim = "#858392",
  purple = "#6B50FF",
  yam = "#FFB587",
  salmon = "#FF7F90",
  sardine = "#4FBEFE",
  squid = "#858392",
  smoke = "#BFBCC8",
  sash = "#ECEBF0",
}

local bufferline_hl = {
  fill = { fg = c.purple, bg = c.bg_dark },
  background = { fg = c.smoke, bg = c.bg_dark },
  buffer = { fg = c.smoke, bg = c.bg_dark },
  buffer_visible = { fg = c.smoke, bg = c.bg_dark },
  buffer_selected = { fg = c.sash, bg = c.bg, bold = true },
  numbers = { fg = c.squid, bg = c.bg_dark },
  numbers_visible = { fg = c.squid, bg = c.bg_dark },
  numbers_selected = { fg = c.sash, bg = c.bg, bold = true },
  duplicate = { fg = c.squid, bg = c.bg_dark, italic = true },
  duplicate_visible = { fg = c.squid, bg = c.bg_dark, italic = true },
  duplicate_selected = { fg = c.squid, bg = c.bg, italic = true },
  separator = { fg = c.bg_dark, bg = c.bg_dark },
  separator_visible = { fg = c.bg_dark, bg = c.bg_dark },
  separator_selected = { fg = c.purple, bg = c.bg },
  indicator_visible = { fg = c.bg_dark, bg = c.bg_dark },
  indicator_selected = { fg = c.purple, bg = c.bg },
  close_button = { fg = c.squid, bg = c.bg_dark },
  close_button_visible = { fg = c.smoke, bg = c.bg_dark },
  close_button_selected = { fg = c.sash, bg = c.bg },
  modified = { fg = c.yam, bg = c.bg_dark },
  modified_visible = { fg = c.yam, bg = c.bg_dark },
  modified_selected = { fg = c.yam, bg = c.bg },
  diagnostic = { fg = c.fg_dim, bg = c.bg_dark },
  diagnostic_visible = { fg = c.fg_dim, bg = c.bg_dark },
  diagnostic_selected = { fg = c.fg_dim, bg = c.bg },
  error = { fg = c.salmon, bg = c.bg_dark },
  error_visible = { fg = c.salmon, bg = c.bg_dark },
  error_selected = { fg = c.salmon, bg = c.bg },
  warning = { fg = c.yam, bg = c.bg_dark },
  warning_visible = { fg = c.yam, bg = c.bg_dark },
  warning_selected = { fg = c.yam, bg = c.bg },
  info = { fg = c.sardine, bg = c.bg_dark },
  info_visible = { fg = c.sardine, bg = c.bg_dark },
  info_selected = { fg = c.sardine, bg = c.bg },
  offset_separator = { fg = c.purple, bg = c.bg_dark },
  pick = { fg = c.purple, bg = c.bg_dark, bold = true },
  pick_visible = { fg = c.purple, bg = c.bg_dark, bold = true },
  pick_selected = { fg = c.purple, bg = c.bg, bold = true },
  tab = { fg = c.smoke, bg = c.bg_dark },
  tab_selected = { fg = c.sash, bg = c.bg, bold = true },
  tab_close = { fg = c.squid, bg = c.bg_dark },
}

return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
    { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
    { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
    { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
  },
  opts = {
    highlights = bufferline_hl,
    options = {
      -- stylua: ignore
      close_command = function(n) Snacks.bufdelete(n) end,
      -- stylua: ignore
      right_mouse_command = function(n) Snacks.bufdelete(n) end,
      diagnostics = "nvim_lsp",
      always_show_bufferline = false,
      diagnostics_indicator = function(_, _, diag)
        local icons = LazyVim.config.icons.diagnostics
        local ret = (diag.error and icons.Error .. diag.error .. " " or "")
          .. (diag.warning and icons.Warn .. diag.warning or "")
        return vim.trim(ret)
      end,
      offsets = {
        {
          filetype = "NvimTree",
          text = "WorkSpace",
          separator = true,
          text_align = "center",
        },
        {
          filetype = "snacks_layout_box",
        },
      },
      ---@param opts bufferline.IconFetcherOpts
      get_element_icon = function(opts)
        return LazyVim.config.icons.ft[opts.filetype]
      end,
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
  end,
}
