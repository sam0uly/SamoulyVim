-- Matugen-generated Neovim colorscheme
-- Generated from wallpaper using material-color-utilities

require("base16-colorscheme").setup({
	base00 = "#161217",
	base01 = "#100d12",
	base02 = "#1e1a20",
	base03 = "#4b454d",
	base04 = "#cdc3ce",
	base05 = "#e8e0e8",
	base06 = "#332f35",
	base07 = "#3c383e",
	base08 = "#f1a1a6",
	base09 = "#f4b7bb",
	base0A = "#d1c1d9",
	base0B = "#deb9f7",
	base0C = "#663a3e",
	base0D = "#583a6f",
	base0E = "#4e4256",
	base0F = "#baa1c6",
})

-- Make selected text stand out more
vim.api.nvim_set_hl(0, "Visual", {
	bg = "#583a6f",
	fg = "#161217",
})
