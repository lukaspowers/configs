-- JS/TS
vim.api.nvim_create_autocmd("FileType", {
    pattern = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    callback = function()
        vim.o.tabstop = 2
        vim.o.shiftwidth = 2
        vim.o.softtabstop = 2
    end,
})
