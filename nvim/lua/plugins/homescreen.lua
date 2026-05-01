-- SETUP HOME SPLASH SCREEN.  
return {
    "goolord/alpha-nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local alpha = require'alpha'
        local dashboard = require'alpha.themes.dashboard'

        dashboard.section.header.val =  {
            "                                                     ",
            "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
            "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
            "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
            "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
            "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
            "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
            "                                                     ",
        }

        dashboard.section.buttons.val = {
            dashboard.button( "o", "📂 Open file" , ":Telescope find_files <CR>"),
            dashboard.button( "e", "➕ New file" , ":ene <BAR> startinsert <CR>"),
            dashboard.button( "q", "💀 Quit" , ":qa<CR>"),
        }

        local handle = io.popen('fortune')
        if handle then
            local fortune = handle:read("*a")
            handle:close()
            dashboard.section.footer.val = fortune
        end
        alpha.setup(dashboard.opts)
    end,
}
