function run_code()
    local source = vim.fn.expand('%:t')
    local dir = vim.fn.expand('%:h')
    file_ext_index = string.find(source, '%.')

    file_ext = string.sub(source, file_ext_index + 1, string.len(source))
   
    local opt_table = {
        ["py"] = python,
        ["c"] = c
    }

    local lang = opt_table[file_ext]
    if lang then
        lang(source, dir)
    else
        print("Sorry, language not supported yet...")
    end
end

function python(src, dir)
    local commands = {
        "cd " .. dir,
        "python3 " .. src
    }
    run(table.concat(commands, " && "))

end

function c(src, dir)
    file_head = string.sub(src, 1, string.find(src, '%.') - 1)
    local commands = {
        "cd " .. dir,
        "gcc -o " .. file_head .. " " .. src,
        "./" .. file_head
    }
    run(table.concat(commands, " && "))
end

function run(cmds)
    vim.cmd.vsplit()
    vim.cmd.terminal()
    vim.fn.feedkeys('a')
    local enter = vim.api.nvim_replace_termcodes("<CR>", true, true, true)
    vim.fn.feedkeys('clear' .. enter)
    vim.fn.feedkeys(cmds .. enter)
end
