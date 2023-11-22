local telescope = require('telescope')
telescope.setup {
	pickers = {
		find_files = {
			-- hidden = true
		}
	}
}

local builtin = require('telescope.builtin')

-- KEYMAPS
vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<Leader>ft', builtin.live_grep, {})
vim.keymap.set('n', '<Leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<Leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<Leader>fr', builtin.registers, {})
vim.keymap.set("n", "<Leader>fh", ':lua require("telescope.builtin").find_files({cwd="$HOME", hidden=true})<CR>')


