-- C/C++
vim.api.nvim_create_autocmd("FileType", {
    pattern = {'c', 'cpp,', 'h'},
    callback = function()
        vim.o.tabstop = 4
        vim.o.shiftwidth = 4
        vim.o.softtabstop = 4
    end,
})
