vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = { "*.tex" },
    callback = function()
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

        if not success or not vim.loop.fs_stat(pdf_path) then
            -- Compilation failed → show errors instead of the real PDF
            local f = io.open(tmp_txt, "w")
            f:write("PDFLaTeX Error Output:\n\n")
            f:write(output)
            f:close()

            -- Convert text error message to PDF for the viewer
            os.execute(string.format("paps %q --font='monospace 10' | ps2pdf - %q", tmp_txt, pdf_path))
            os.remove(tmp_txt)
        end
    end,
})

