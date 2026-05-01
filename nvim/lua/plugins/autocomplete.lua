-- SETUP FOR AUTOCOMPLETE DIALOGUE AND DROP BOX.
return {
    {
        "hrsh7th/nvim-cmp",
        -- Last release is too old.
        version = false,
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
        opts = function()
            local cmp = require('cmp')
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<TAB>'] = cmp.mapping.confirm(
                        {
                            behavior = cmp.ConfirmBehavior.Insert,
                            select = true
                        }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'path' },
                },
                    {
                        { name = 'buffer' },
                    })
            })
        end
    }
}
