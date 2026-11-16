require("nvchad.configs.lspconfig").defaults()

local servers = {
  "clangd",
  "csharp_ls",
  "html",
  "cssls",
  "tailwindcss",
  "pyright",
  "ts_ls",
  "lua_ls"
}

vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--query-driver=**",
  },
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },

      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        },
      },

      telemetry = {
        enable = false,
      },
    },
  },
})

vim.lsp.enable(servers)
