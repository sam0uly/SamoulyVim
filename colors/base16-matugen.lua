vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "base16-matugen"
vim.o.termguicolors = true

local generated_path = vim.fn.stdpath("config") .. "/generated.lua"
local file = io.open(generated_path, "r")

if file then
  io.close(file)
  dofile(generated_path)
else
  vim.cmd("highlight Normal guibg=#1e1e2e guifg=#cdd6f4")
end

vim.api.nvim_create_autocmd("Signal", {
  pattern = "SIGUSR1",
  callback = function()
    local f = io.open(generated_path, "r")
    if f then
      io.close(f)
      dofile(generated_path)
    end
  end,
})
