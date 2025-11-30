-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
		{ import = "plugins.lsp" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "gruvbox" } },
	-- automatically check for plugin updates
	checker = { enabled = false },
})

-- vim settings
vim.cmd([[autocmd FileType * set formatoptions-=ro]])
vim.opt.cmdheight = 0 -- sets the vimline lower (also can cause problems with messages or something)
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]]) -- color scheme
vim.opt.fillchars = { eob = " " } -- remove ~ for empty lines
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
vim.cmd([[set clipboard+=unnamedplus]]) -- clipboard stuff
vim.cmd([[set number]]) -- line number
vim.opt.cursorline = true -- buffer line for cursor
-- removes this annoying line next to numbers
vim.cmd([[set foldcolumn=0]])
vim.cmd([[set signcolumn=no]])
-- vim.cmd([[set wildcharm=<Tab>]])
vim.cmd([[set wildmode=list:longest,full]])

vim.diagnostic.enable(false)

-- vim behavior settings
vim.opt.errorbells = false -- no error bells
vim.opt.path:append("**") -- include subdirectories in search

-- keymaps
require("config.mappings")
