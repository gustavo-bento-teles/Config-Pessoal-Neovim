local root = vim.fs.root(0, "platformio.ini")

if not root then
    return
end

vim.g.pioConfig = {
    lsp = "clangd",
    clangd_source = "compiledb",
    picker_backend = "auto",
    menu_key = "<leader>\\",
    debug = false,
}

local platformio = require("platformio")
platformio.setup(vim.g.pioConfig)

