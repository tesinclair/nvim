function exit_current_dir()
    local dir_path = vim.fn.expand('%:p:h')

    -- FIX: Use stdpath('cache') to find a valid temporary location on any OS
    local cache_dir = vim.fn.stdpath("cache")
    local file_path = cache_dir .. "/curpth.util"

    -- Ensure the directory exists before writing
    if vim.fn.isdirectory(cache_dir) == 0 then
        vim.fn.mkdir(cache_dir, "p")
    end

    local file = assert(io.open(file_path, "w"))
    file:write(dir_path)
    file:close()

    vim.cmd('wq')
end
