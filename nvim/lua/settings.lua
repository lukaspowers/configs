print("Settings")
-- Leader key remap.
vim.g.mapleader = " "

-- Compatibility vim only.
vim.o.compatible = false

-- Status Bar on bottom screen.
vim.o.laststatus = 3

-- General Config.
vim.o.encoding = "UTF-8"
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

-- Searching.
-- vim.o.hlsearch = false
vim.o.incsearch = true
vim.lsp.buf.document_highlight()

-- Clipboard copy.
vim.api.nvim_set_keymap('v', '<C-C>', '"+y', { noremap = true })

-- Open a new tab.
vim.api.nvim_set_keymap('n', '<leader>t', ':tabnew<CR>', { noremap = true })

-- Go to definition.
vim.api.nvim_set_keymap('n', '<F12>', '<C-]>', { noremap = true })

-- Trigger vertical split.
vim.api.nvim_set_keymap('n', '<leader>vs', ':vnew<CR>', { noremap = true })

-- Autocomplete brackets.
vim.api.nvim_set_keymap('i', '{', '{}<Esc>ha', { noremap = true })

-- Terminal command.
vim.api.nvim_set_keymap('n', '<leader>cm', ':!command', { noremap = true })

-- Removes ~ character from empty lines in sidebar.
vim.o.fillchars = "fold: ,vert:│,eob: ,msgsep:‾"

-- Filetype specific configs.
require("file_config")
