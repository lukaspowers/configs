-- SETUP FILE TREE ON LEFT SIDE OF SCREEN.
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    opts = {
        open_on_setup = false,
        open_on_setup_file = false,
        open_on_tab_enter = false,
        close_if_last_window = true,
        filesystem = {
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
    },
    config = function()
        require("neo-tree").setup({
            event_handlers = {
                {
                    event = "file_open_requested",
                    handler = function()
                        vim.cmd("Neotree close")
                    end
                },
            }
        })

        vim.keymap.set('n', '<leader>e', ":Neotree toggle<CR>", {})
    end
}
