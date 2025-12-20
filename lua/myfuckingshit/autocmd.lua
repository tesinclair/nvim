vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = { "*.tex" },
    callback = function()
        -- FIX: Guard clause to prevent execution if tools are missing
        if vim.fn.executable("pdflatex") == 0 then
            return
        end

        local fname = vim.api.nvim_buf_get_name(0)
        local basename = fname:match("(.+)%.tex$")
        if not basename then return end

        local pdf_path = basename .. ".pdf"
        local tmp_txt = basename .. "_error.txt"

        -- Run pdflatex and capture output
        local handle = io.popen(string.format("pdflatex -interaction=nonstopmode %q 2>&1", fname))
        local output = handle:read("*a")
        handle:close()

        -- Check if the output contains success message
        local success = output:match("Output written on")

        -- Only run conversion if tools exist
        if (not success or not vim.loop.fs_stat(pdf_path)) and vim.fn.executable("paps") == 1 and vim.fn.executable("ps2pdf") == 1 then
            local f = io.open(tmp_txt, "w")
            f:write("PDFLaTeX Error Output:\n\n")
            f:write(output)
            f:close()

            os.execute(string.format("paps %q --font='monospace 10' | ps2pdf - %q", tmp_txt, pdf_path))
            os.remove(tmp_txt)
        end
    end,
})
