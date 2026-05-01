-- SETUP FILE TREE ON LEFT SIDE OF SCREEN.
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            filesystem = {
                follow_current_file = {
                    enabled = true,
                    leave_dirs_open = true,
                },
                filtered_items = {
                    visible = true,
                    show_hidden_count = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_by_name = {
                        '.DS_Store',
                    },
                    never_show = {},
                },
            },
        })

        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                vim.schedule(function()
                    vim.cmd("Neotree show")
                end)
            end,
        })

        vim.api.nvim_create_autocmd("TabNew", {
            callback = function()
                vim.schedule(function()
                    if vim.bo.buftype == "" then
                        vim.cmd("Neotree focus")
                    end
                end)
            end,
        })

        vim.keymap.set('n', '<leader>e', ":Neotree toggle<CR>", {})
    end
}
