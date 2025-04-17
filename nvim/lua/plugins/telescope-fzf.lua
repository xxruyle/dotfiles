return {
	{ 
		'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release', config = function() 
	require('telescope').setup()
	vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {desc = "Telescope: find_files"})
	vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, {desc = "Telescope: live_grep"})
	vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, {desc = "Telescope: Search keymaps"})
	vim.keymap.set('n', '<leader>s.', require('telescope.builtin').oldfiles, {desc = 'Telescope: Search recent files("." for repeat)'})
	vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, {desc = 'Telescope: Search current word under cursor'})
	vim.keymap.set('n', '<leader>sh', require('telescope.builtin').highlights, {desc = 'Telescope: Lists all available highlights'})
   end
   }

}
