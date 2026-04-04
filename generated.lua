-- Matugen-generated Neovim colorscheme
-- Generated from wallpaper using material-color-utilities

require("base16-colorscheme").setup({
	base00 = "#151218",
	base01 = "#0f0d13",
	base02 = "#1d1b20",
	base03 = "#49454e",
	base04 = "#cbc4cf",
	base05 = "#e7e0e8",
	base06 = "#322f35",
	base07 = "#3b383e",
	base08 = "#eca2b4",
	base09 = "#f0b7c5",
	base0A = "#cdc2db",
	base0B = "#d2bcfd",
	base0C = "#643b46",
	base0D = "#4f3d74",
	base0E = "#4b4358",
	base0F = "#b3a2c8",
})

-- Make selected text stand out more
vim.api.nvim_set_hl(0, "Visual", {
	bg = "#4f3d74",
	fg = "#151218",
})
