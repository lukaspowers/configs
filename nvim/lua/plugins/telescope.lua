-- SETUP TELESCOPE FOR FINDING STUFF AND OPENING FILES.
return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'BurntSushi/ripgrep'
        },
        config = function()
            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<leader>,', builtin.find_files, {})
            vim.keymap.set('n', '<leader>F', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>f', builtin.current_buffer_fuzzy_find, {})
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require("telescope").setup ({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    }
}
