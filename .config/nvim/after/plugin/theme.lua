-- theme
require('tokyonight').setup({
    -- darker style
    style = "night",

    -- disable transparency and terminal colors
    transparent = false,
    terminal_colors = false,

    -- disable italics
    styles = {
        comments = { italic = false },
        keywords = { italic = false }
    }
})

vim.cmd.colorscheme('tokyonight')

