local status_ok, telescope = pcall(require, 'telescope')

if not status_ok then
	return
end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

telescope.setup({
	defaults = {
		{ scroll_strategy = "limit" },
		{ prompt_prefix = "Search: " },
		{ selection_caret = ">> " }
	}
})

-- telescope keymaps
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fg', function() builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
	previewer = false,
	prompt_title = "Find in current file"
}) end, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

