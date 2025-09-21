-- hipatterns - uppercased words like fixme, todo, note and so on.
-- this setting help to hightlight them in code.
local hp = require("mini.hipatterns")

-- my custom highlight groups
-- zero in parameters means globally highlight group
-- i will use colors from tokyonight theme plugin
local colors = require('tokyonight.colors').setup()
local util = require('tokyonight.util')
-- text color (fg)
local tcolor = util.lighten(colors.black, 0.8)

vim.api.nvim_set_hl(0, 'myHipatternFixme', { fg = tcolor, bg = colors.red })
vim.api.nvim_set_hl(0, 'myHipatternTodo', { fg = tcolor, bg = colors.todo })
vim.api.nvim_set_hl(0, 'myHipatternNote', { fg = tcolor, bg = colors.hint })
vim.api.nvim_set_hl(0, 'myHipatternPerf', { fg = tcolor, bg = colors.purple })
vim.api.nvim_set_hl(0, 'myHipatternHack', { fg = tcolor, bg = colors.orange })

hp.setup({
	highlighters = {
		-- highlight standalone 'FIXME', 'TODO', 'NOTE', 'PERF', 'HACK'
		fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'myHipatternFixme' },
		todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'myHipatternTodo'  },
		note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'myHipatternNote'  },
		perf  = { pattern = '%f[%w]()PERF()%f[%W]', group = 'myHipatternPerf' },
		hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'myHipatternHack'  },
	}
})
