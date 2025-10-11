-- CONFIGURE TREESITTER FOR DIFFERENT PROGRAMMING LANGUAGES.
return {
    'nvim-treesitter/nvim-treesitter',
    built = ':TSUpdate',
    config = function()
        require("nvim-treesitter.configs").setup({

            ensure_installed = {
                "lua",
                "c",
                "vim",
                "vimdoc",
                "typescript",
                "python"
            },
            highlight = { enable = true },
            indent = { enable = true }
        })

        -- Rename variables shortcut.
        vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename, { desc = "Rename variable" })
    end
}
