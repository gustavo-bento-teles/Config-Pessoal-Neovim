return {
  function()
    local platformio_ini = vim.fn.getcwd() .. "/platformio.ini"

    if vim.fn.filereadable(platformio_ini) == 0 then
      return
    end

    vim.g.pioConfig = {
      lsp = "clangd",
      clangd_source = "compiledb",
      picker_backend = "auto",
      menu_key = "<leader>\\",
      debug = false,
    }

    local ok, platformio = pcall(require, "platformio")
    if ok then
      platformio.setup(vim.g.pioConfig)
    end
  end,
}
