return {
	{ 
		'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release', config = function() 
	require('telescope').setup()
	vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {desc = "Telescope: find_files"})
	vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, {desc = "Telescope: live_grep"})
   end
   }

}
