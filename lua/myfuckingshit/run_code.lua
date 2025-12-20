function run_code()
    local source = vim.fn.expand('%:t')
    local dir = vim.fn.expand('%:h')
    
    -- Robust extension extraction
    local file_ext = vim.fn.fnamemodify(source, ":e")
   
    local opt_table = {
        ["py"] = python,
        ["c"] = c
    }

    local lang = opt_table[file_ext]
    if lang then
        lang(source, dir)
    else
        print("Sorry, language not supported yet: " .. file_ext)
    end
end

function python(src, dir)
    -- FIX: Check if python3 exists, otherwise fall back to python (common on Windows)
    local python_exe = vim.fn.executable('python3') == 1 and 'python3' or 'python'
    
    local commands = {
        "cd " .. dir,
        python_exe .. " " .. src
    }
    -- Use specific joiner? '&&' works in CMD, PowerShell, and Bash.
    run(table.concat(commands, " && "))
end

function c(src, dir)
    -- Remove extension safely
    local file_head = vim.fn.fnamemodify(src, ":r")
    
    -- Detect OS for executable format
    local is_win = vim.loop.os_uname().sysname == "Windows_NT"
    local out_file = is_win and (file_head .. ".exe") or ("./" .. file_head)

    local commands = {
        "cd " .. dir,
        "gcc -o " .. file_head .. " " .. src,
        out_file
    }
    run(table.concat(commands, " && "))
end

function run(cmds)
    vim.cmd.vsplit()
    vim.cmd.terminal()
    vim.fn.feedkeys('a')
    -- Replaced raw strings with termcodes for better compatibility
    local enter = vim.api.nvim_replace_termcodes("<CR>", true, true, true)
    
    -- 'clear' is not always available on Windows CMD, 'cls' is. 
    -- But usually terminal starts clean enough.
    if vim.fn.has("win32") == 1 then
        vim.fn.feedkeys(cmds .. enter)
    else
        vim.fn.feedkeys('clear' .. enter)
        vim.fn.feedkeys(cmds .. enter)
    end
end
