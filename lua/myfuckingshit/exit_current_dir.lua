function exit_current_dir()
    local dir_path = vim.fn.expand('%:p:h')

    -- Lua doesn't seem to recognise ~
    local home = os.getenv("HOME");
    local file_path = home .. "/tmp/vim/curpth.util"

    local file = assert(io.open(file_path, "w"))
    file:write(dir_path)
    file:close()

    vim.cmd('wq')
end


