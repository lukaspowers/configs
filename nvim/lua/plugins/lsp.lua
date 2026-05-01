-- SETUP LANGUAGE SERVERS FOR DIFFERENT LANGUAGES.

-- Highlight reoccuring words in the same file.
local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

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
            cmd = { vim.fn.exepath('lua-language-server') },

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
            cmd = { vim.fn.exepath('pyright'), "--stdio" },
            on_attach = on_attach,
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
                vim.fn.exepath('clangd'),
                '--background-index',
                '--clang-tidy',
                '--completion-style=detailed'
            },
            filetypes = { 'c', 'cpp', 'h', 'hpp', 'objc', 'objcpp' },
            on_attach = on_attach,
        })

        vim.lsp.config('ts_ls', {
            cmd = { vim.fn.exepath('typescript-language-server'), '--stdio' },
            filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
            on_attach = on_attach,
        })

        vim.lsp.config('gopls', {
            cmd = { vim.fn.exepath('gopls') },
            on_attach = on_attach,
        })

        vim.lsp.config('rust_analyzer', {
            cmd = { vim.fn.exepath('rust-analyzer') },
            on_attach = on_attach,
        })

        vim.lsp.config('jdtls', {
            cmd = { vim.fn.exepath('jdtls') },
            on_attach = on_attach,
        })

        vim.lsp.enable('lua_ls')
        vim.lsp.enable('clangd')
        vim.lsp.enable('pyright')
        vim.lsp.enable('ts_ls')
        vim.lsp.enable('gopls')
        vim.lsp.enable('rust_analyzer')
        vim.lsp.enable('jdtls')

        vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename, { desc = "Rename variable" })
    end
}
