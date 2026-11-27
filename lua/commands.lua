vim.api.nvim_create_user_command("PioClangd", function()
    local root = vim.fs.root(0, "platformio.ini")

    if not root then
        print("PlatformIO Project not found!")
        return
    end

    local filepath = root .. "/.clangd"

    if vim.uv.fs_stat(filepath) then
        print("File .clangd already exists!")
        return
    end

    local content = {
        "CompileFlags:",
        "  Remove:",
        "    - -mlongcalls",
        "    - -mtext-section-literals",
        "    - -fipa-pta",
        "    - -free",
    }

    vim.fn.writefile(content, filepath)

    print("File .clangd successfully created!")
end, {})
