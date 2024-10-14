return {
	{ 
		'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release', config = function() 
	require('telescope').setup()
	vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {desc = "Telescope: find_files"})
   end
   }

}
