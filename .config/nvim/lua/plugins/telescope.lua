return {
	"nvim-telescope/telescope.nvim",
	tag = "v0.2.0",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		local builtin = require("telescope.builtin")

		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules/",
					"dist/",
					"%.git/", -- ignore .git folder
					"build/", -- any folder you want to ignore
				},
			},
		})
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		vim.keymap.set("n", "<leader>sk", require("telescope.builtin").keymaps, { desc = "Telescope: Search keymaps" })
		vim.keymap.set(
			"n",
			"<leader>s.",
			require("telescope.builtin").oldfiles,
			{ desc = 'Telescope: Search recent files("." for repeat)' }
		)
		vim.keymap.set(
			"n",
			"<leader>sw",
			require("telescope.builtin").grep_string,
			{ desc = "Telescope: Search current word under cursor" }
		)
		vim.keymap.set(
			"n",
			"<leader>sh",
			require("telescope.builtin").highlights,
			{ desc = "Telescope: Lists all available highlights" }
		)
	end,
}
