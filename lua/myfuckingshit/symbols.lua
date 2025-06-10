vim.opt.conceallevel = 2
vim.opt.concealcursor = "niv"


vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        vim.cmd([[syntax match Operator "!=" conceal cchar=≠]])
        vim.cmd([[syntax match Operator ">=" conceal cchar=≥]])
        vim.cmd([[syntax match Operator "<=" conceal cchar=≤]])
        vim.cmd([[syntax match Operator "==" conceal cchar=≡]])

        vim.cmd([[syntax match Operator "&&" conceal cchar=∧]])
        vim.cmd([[syntax match Operator "||" conceal cchar=∨]])

        vim.cmd([[syntax match Operator "->" conceal cchar=→]])
        vim.cmd([[syntax match Operator "!" conceal cchar=¬]])

        vim.cmd([[syntax match Operator "\*\*" conceal cchar=^]])
        vim.cmd([[syntax match Operator "sqrt" conceal cchar=√]])
        vim.cmd([[syntax match Operator "sum" conceal cchar=∑]])
        vim.cmd([[syntax match Operator "pi" conceal cchar=π]])

        vim.cmd([[syntax match RangeFor "\s:\s" conceal cchar= ∈ ]])
    end,
})
