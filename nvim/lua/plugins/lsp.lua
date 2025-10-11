-- SETUP LANGUAGE SERVERS FOR DIFFERENT LANGUAGES.

-- Highlight reoccuring words in the same file.
local on_attach = function(client, bufnr)
    if client.server_capabilities.documentHighlightProvider then
        local group = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = false })
        vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })

        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            group = group,
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd("CursorMoved", {
            group = group,
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
        })
    end
end

-- Show error message window when hovering over an error.
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})

return {
    "neovim/nvim-lspconfig",
    config = function()

        vim.lsp.config('lua_ls', {
            cmd = { "/usr/local/bin/lua-language-server/bin/lua-language-server" },

            settings = {
                Lua = {
                    workspace = {
                        checkThirdParty = false,
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
            on_attach = on_attach,
        })

        vim.lsp.config('pyright', {
            cmd = { "/usr/local/bin/pyright", "--stdio" },

            settings = {
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        diagnosticMode = "openFilesOnly",
                        useLibraryCodeForTypes = true
                    }
                }
            },
        })

        vim.lsp.config('clangd', {
            cmd = {
                '/usr/bin/clangd-20',
                '--background-index',
                '--clang-tidy',
                '--completion-style=detailed'
                -- Add any other necessary arguments here
            },
            filetypes = { 'c', 'cpp', 'h', 'hpp', 'objc', 'objcpp' },
            -- on_attach = function(client, bufnr)
            --     -- ... keymaps, etc.
            -- end,
        })

        vim.lsp.enable('lua_ls')
        vim.lsp.enable('clangd')
        vim.lsp.enable('pyright')

    end
}
