---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",
}

M.mason = {
  pkgs = {
    "clangd",
    "csharp-language-server",
    "pyright",
    "tailwindcss-language-server",
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "lua-language-server",
    "prettierd",
  },
}

return M
