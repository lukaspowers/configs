-- SETUP EDITOR APPEARANCE/VISUALS.

-- Tab Display
function Tabline()
  local s = ''
  for i = 1, vim.fn.tabpagenr('$') do
    local winnr = vim.fn.tabpagewinnr(i)
    local buflist = vim.fn.tabpagebuflist(i)
    local bufnr = buflist[winnr]
    local bufname = vim.fn.bufname(bufnr)
    local filename = vim.fn.fnamemodify(bufname, ':t') -- only filename, not full path

    if filename == '' then
      filename = '[No Name]'
    end

    if i == vim.fn.tabpagenr() then
      s = s .. '%#TabLineSel# ' .. filename .. ' '
    else
      s = s .. '%#TabLine# ' .. filename .. ' '
    end
  end
  s = s .. '%#TabLineFill#'
  return s
end

vim.o.tabline = [[%!v:lua.Tabline()]]

-- Plugin Setup.
return {
    -- Theme.
    {
        "navarasu/onedark.nvim",
        lazy = false,
        name = "onedark",
        priority = 1000,
        opts = {
            style = 'deep'
        },
        config = function()
            require("onedark").setup({
                -- Style Options: "dark", "darker", "cool", "deep", "warm", "warmer", "light"
                style = "dark",
            })

            vim.cmd.colorscheme "onedark"
            vim.opt.termguicolors = true
        end
    },
    -- Vertical Paragraph Lines.
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {
            indent = {
                char = '|'
            }
        },
    }
}
