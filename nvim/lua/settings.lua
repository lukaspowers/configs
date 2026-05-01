-- Leader key remap.
vim.g.mapleader = " "

-- Status Bar on bottom screen.
vim.o.laststatus = 3

-- General Config.
vim.o.number = true
vim.o.wrap = false
vim.o.mouse = "a"
vim.opt.updatetime = 300
vim.opt.signcolumn = "yes"
vim.opt.splitright = true

-- Default Tabs, Indents, and Spaces.
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true

-- Indents.
vim.o.autoindent = true
vim.o.smartindent = true

-- Clipboard copy.
vim.api.nvim_set_keymap('v', '<C-C>', '"+y', { noremap = true })

-- Open a new tab.
vim.api.nvim_set_keymap('n', '<leader>t', ':tab split<CR>', { noremap = true })

-- Go to definition.
vim.keymap.set('n', '<F12>', vim.lsp.buf.definition, { noremap = true })

-- Trigger vertical split.
vim.api.nvim_set_keymap('n', '<leader>vs', ':vnew<CR>', { noremap = true })

-- Autocomplete brackets.
vim.api.nvim_set_keymap('i', '{', '{}<Esc>ha', { noremap = true })

-- Auto-reload files changed outside of neovim.
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
    callback = function()
        if vim.fn.mode() ~= 'c' then
            vim.cmd("checktime")
        end
    end,
})

-- Removes ~ character from empty lines in sidebar.
vim.o.fillchars = "fold: ,vert:│,eob: ,msgsep:‾"

-- Filetype specific configs.
require("file_config")

