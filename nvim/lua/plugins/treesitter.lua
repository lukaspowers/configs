-- CONFIGURE TREESITTER FOR DIFFERENT PROGRAMMING LANGUAGES.
return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter').install({
            'lua', 'c', 'vim', 'vimdoc', 'typescript', 'tsx', 'python', 'go', 'rust', 'java'
        })

        vim.api.nvim_create_autocmd('FileType', {
            callback = function()
                pcall(vim.treesitter.start)
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })

    end
}
